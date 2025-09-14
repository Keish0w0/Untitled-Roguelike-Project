class_name Player extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed = 650
@export var accel = 6
@export var friction = 8
@export var dash_speed = max_speed * 3.5

@export var max_health: float = 5

var health: float:
	set(value):
		health = value
		%Health.value = value

####### SHIKO EDIT
var can_take_damage: bool = true

##DASH
@onready var dash_cooldown = $DashCooldown
var can_dash = true

##PLAYER INPUT
var input = Vector2.ZERO

##PLAYER ANIMATION
@onready var anim_sprite = $Player

@onready var dmg_cooldown = $DamageCooldown
@onready var hurtbox = $Hurtbox

func _ready() -> void:
	health = max_health

#MOVEMENT SCRIPT
func _physics_process(delta: float) -> void:
	input = get_input()
	var lerp_weight = delta * (accel if input else friction)
	velocity = velocity.lerp(input * max_speed, lerp_weight)
	
	flip_sprite()
	move_and_slide()

func get_input():
	input.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	return input.normalized()

func flip_sprite():
	anim_sprite.flip_h = input.x < 0

func take_damage(amount):
	health -= amount
	print(health)



func _on_hurtbox_body_entered(body: Node2D) -> void:
	
	if not can_take_damage:
		return

	if body.has_method("damage"):
		take_damage(body.damage)
		can_take_damage = false
		dmg_cooldown.start()
		%Collision.set_deferred("disabled", true)
	var array = [hurtbox.get_overlapping_bodies()]
	if array:
		take_damage(body.damage)
	dmg_cooldown.start()
	%Collision.set_deferred("disabled", true)

func _on_damage_cooldown_timeout() -> void:
	can_take_damage = true
	%Collision.set_deffered("disabled", false)
