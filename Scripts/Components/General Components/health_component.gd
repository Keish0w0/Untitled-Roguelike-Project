class_name HealthComponent extends Node2D

signal took_damage

@export var hitbox_component = Node2D
@onready var player = $".."

##HEALTH
@export var max_health : float = 5
var health : float

func _ready() -> void:
	health = max_health

func damage(dmg):
	health -= dmg
	print(health)
	player.anim.hurt()
	emit_signal("took_damage")

	if health <= 0:
		game_over()

func regen(heal):
	health += heal
	print(health)

	if health >= max_health:
		health = max_health

func game_over():
	print("Game Over")
