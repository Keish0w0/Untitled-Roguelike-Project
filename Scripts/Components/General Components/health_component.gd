class_name HealthComponent extends Node2D

signal took_damage

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
	emit_signal("took_damage")

	if health <= 0:
		death()

func regen(heal):
	health += heal
	print(health)

	if health >= max_health:
		health = max_health

func death():
	if parent != Player:
		parent.queue_free()
