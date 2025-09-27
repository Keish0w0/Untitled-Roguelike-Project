class_name HealthComponent extends Node2D

@export var hitbox_component = Node2D

##HEALTH
@export var max_health = 5
var health

func _ready() -> void:
	health = max_health

func damage(damage):
	health -= damage
	print(health)

	if health <= 0:
		game_over()

func heal(heal):
	health += heal
	print(health)

	if health >= max_health:
		health = max_health

func game_over():
	print("Game Over")
