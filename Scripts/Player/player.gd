class_name Player extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed : float  = 650
@export var accel : float  = 6
@export var friction : float  = 8
@export var dash_speed : float = max_speed * 3.5

##DASH
@onready var dash_stamina : float = 25
var can_dash : bool = true
var is_dashing : bool = false

##DAMAGE
var dmg_cooldown : bool = false

##PLAYER INPUT
var input = Vector2.ZERO

##PLAYER ANIMATION
@onready var player_sprite = $PlayerSprite

func _physics_process(delta: float) -> void:
	
	#MOVEMENT SCRIPT
	input = $InputComponent.movement
	var lerp_weight = delta * (accel if input else friction)
	velocity = velocity.lerp(input * max_speed, lerp_weight)

	flip_sprite()
	move_and_slide()
#MOVEMENT SCRIPT

func flip_sprite():
	player_sprite.flip_h = input.x < 0
