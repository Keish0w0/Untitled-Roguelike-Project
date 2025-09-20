class_name HealthComponent extends Node2D

@export var hitbox_component: HitboxComponent

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
	
	if health <= 0:
		game_over()

func damage_cooldown():
	dmg_cooldown.start()

func _on_damage_cooldown_timeout() -> void:
	hitbox_component.enable_collision()

func game_over():
	print("You Died")
