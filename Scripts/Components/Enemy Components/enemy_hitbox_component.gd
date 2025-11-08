class_name EnemyHitboxComponent extends Area2D

@export var health_component: EnemyHealthComponent
@export var animation_component: AnimationComponent
@onready var hitbox : CollisionShape2D = $Hitbox
@onready var parent : CharacterBody2D = $".."

func take_damage(damage):
	animation_component.hit_flash()
	parent.damage_popup(damage)
	health_component.damage(damage)

func disable_collision():
	hitbox.set_deferred("disabled", true)

func enable_collision():
	hitbox.set_deferred("disabled", false)
