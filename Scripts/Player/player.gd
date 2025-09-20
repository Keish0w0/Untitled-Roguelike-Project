class_name Player extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed = 650
@export var accel = 6
@export var friction = 8
@export var dash_speed = max_speed * 3.5

##DASH
@onready var dash_stamina = 25
var can_dash = true
var is_dashing = false

##PLAYER INPUT
var input = Vector2.ZERO

##PLAYER ANIMATION
@onready var player_sprite = $PlayerSprite

func _physics_process(delta: float) -> void:
	#MOVEMENT SCRIPT
	input = get_input()
	var lerp_weight = delta * (accel if input else friction)
	velocity = velocity.lerp(input * max_speed, lerp_weight)

	flip_sprite()
	move_and_slide()

func get_input():
	input.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	return input.normalized()
#MOVEMENT SCRIPT

func flip_sprite():
	player_sprite.flip_h = input.x < 0
