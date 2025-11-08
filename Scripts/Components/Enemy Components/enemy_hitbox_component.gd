class_name EnemyHitboxComponent extends Area2D

@export var health_component: EnemyHealthComponent
@export var animation_component: AnimationComponent
@onready var hitbox = $Hitbox

func take_damage(damage):
	animation_component.hit_flash()
	health_component.damage(damage)

func disable_collision():
	hitbox.set_deferred("disabled", true)

func enable_collision():
	hitbox.set_deferred("disabled", false)
