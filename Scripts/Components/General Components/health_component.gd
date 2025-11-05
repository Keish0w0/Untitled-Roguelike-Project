class_name HealthComponent extends Node2D


@export var hitbox_component = Node2D
@onready var parent : CharacterBody2D = $".."

##HEALTH
@export var max_health : float = 5
var health : float

func _ready() -> void:
	health = max_health

func damage(dmg):
	health -= dmg
	if parent == Player:
		parent.anim.hurt()

	if health <= 0:
		if parent.has_node("EnemyCollision"):
			parent.drop_comp.drop_item()
		death()

func regen(heal):
	health += heal
	print(health)

	if health >= max_health:
		health = max_health

func death():
	if parent.has_node("EnemyCollision"):
		parent.queue_free()
	else: print("game over!")
