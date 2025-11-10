class_name HealthComponent extends Node2D


@export var hitbox_component = Area2D
@onready var player : CharacterBody2D = $".."

##HEALTH
var health : float:
	set(value):
		health = max(value, 0)
		%Health.value = value

var max_health : float:
	set(value):
		max_health = value
		%Health.max_value = value

@onready var health_recovery : float = player.health_recovery
@onready var health_cooldown = $HealthCooldown

var health_regen : bool = false

func _ready() -> void:
	max_health = player.max_health
	health = max_health

func damage(dmg):
	health -= dmg
	health_regen = false
	player.anim.hurt()
	
	health_cooldown.start()

	if health <= 0:
		death()

func regen(heal):
	health += heal
	print(health)

	if health >= max_health:
		health = max_health

func death():
	print("game over!")

func _on_health_cooldown_timeout() -> void:
	health_regen = true

func _on_health_timer_timeout() -> void:
	if health_regen == true:
		health += health_recovery
