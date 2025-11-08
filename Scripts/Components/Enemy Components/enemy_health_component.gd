class_name EnemyHealthComponent extends Node2D


@export var hitbox_component = Area2D
@onready var parent : CharacterBody2D = $".."

##HEALTH
@export var max_health : float = 5
var health : float

func _ready() -> void:
	health = max_health

func damage(dmg):
	health -= dmg

	if health <= 0:
		parent.drop_comp.drop_item()
		death()

func regen(heal):
	health += heal
	print(health)

	if health >= max_health:
		health = max_health

func death():
	parent.queue_free()
	print("game over!")
