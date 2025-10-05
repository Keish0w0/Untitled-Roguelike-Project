class_name Player extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed : float  = 125.0
@export var accel : float  = 6.0
@export var friction : float  = 8.0
@export var dash : float = 2.5
var dash_speed : float = max_speed * dash

##DASH
@onready var dash_stamina : float = 25
var can_dash : bool = true
var is_dashing : bool = false

##DAMAGE
var dmg_cooldown : bool = false

##COMPONENT REFERENCES
@onready var anim = $AnimationManager

var input : Vector2

func _process(_delta: float) -> void:
	input = $InputComponent.movement

func frame_freeze(time_scale: float, duration: float) -> void:
	Engine.time_scale = time_scale
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1.0
