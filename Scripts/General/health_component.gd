class_name HealthComponent extends Node2D

##HEALTH
@export var max_health = 5
var health

func _ready() -> void:
	health = max_health
	print(health) 

func damage(attack):
	health -= attack
	print(health) 
	
	if health <= 0:
		print("You Died")
