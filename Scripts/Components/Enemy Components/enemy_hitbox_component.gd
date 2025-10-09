class_name EnemyHitboxComponent extends Area2D

@export var health_component: HealthComponent
@onready var hitbox = $Hitbox

func take_damage(damage):
	health_component.damage(damage)
	print(damage)

func disable_collision():
	hitbox.set_deferred("disabled", true)

func enable_collision():
	hitbox.set_deferred("disabled", false)
