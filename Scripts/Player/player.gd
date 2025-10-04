class_name Player extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed : float  = 650.0
@export var accel : float  = 6.0
@export var friction : float  = 8.0
@export var dash_speed : float = max_speed * 3.5

##DASH
@onready var dash_stamina : float = 25
var can_dash : bool = true
var is_dashing : bool = false

##DAMAGE
var dmg_cooldown : bool = false

##COMPONENT REFERENCES
var input : Vector2

##PLAYER ANIMATION
@onready var player_sprite = $PlayerSprite

func _process(_delta: float) -> void:
	input = $InputComponent.movement

func flip_sprite():
	player_sprite.flip_h = input.x < 0
