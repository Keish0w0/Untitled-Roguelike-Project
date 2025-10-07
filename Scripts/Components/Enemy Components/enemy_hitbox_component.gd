class_name EnemyHitboxComponent extends Area2D

@export var health_component: HealthComponent
@onready var hitbox = $Hitbox

func take_damage(attack):
	health_component.damage(attack)
	disable_collision()

func disable_collision():
	hitbox.set_deferred("disabled", true)

func enable_collision():
	hitbox.set_deferred("disabled", false)
