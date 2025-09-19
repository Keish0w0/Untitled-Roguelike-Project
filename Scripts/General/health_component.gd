class_name HealthComponent extends Node2D

##HEALTH
@export var max_health = 5
var health

@onready var dmg_cooldown = $DamageCooldown

func _ready() -> void:
	health = max_health
	print(health) 

func damage(attack):
	health -= attack
	print(health) 
	
	damage_cooldown()
	%Hitbox.set_deferred("disabled", true)
	
	if health <= 0:
		game_over()

func damage_cooldown():
	dmg_cooldown.start()

func _on_damage_cooldown_timeout() -> void:
	%Hitbox.set_deferred("disabled", false)

func game_over():
	print("You Died")
