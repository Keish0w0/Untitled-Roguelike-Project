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
@onready var anim = $PlayerAnimationComponent
@onready var staff = $WeaponAim
@onready var xp = $XPComponent

##INPUT 
var input : Vector2

##NEAREST ENEMY
var nearest_enemy : CharacterBody2D
var nearest_enemy_distance : float = INF

##AIM
var auto_aim : bool = true

func _process(_delta: float) -> void:
	input = $InputComponent.movement
	
	if nearest_enemy:
		nearest_enemy_distance = nearest_enemy.seperation
	else:
		nearest_enemy_distance = INF

func frame_freeze(time_scale: float, duration: float) -> void:
	Engine.time_scale = time_scale
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1.0

func _on_aim() -> void:
	if auto_aim == true:
		auto_aim = false
	elif auto_aim == false:
		auto_aim = true
