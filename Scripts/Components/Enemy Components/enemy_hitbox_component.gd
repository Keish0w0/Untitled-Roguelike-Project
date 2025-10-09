class_name EnemyHitboxComponent extends Area2D

@export var health_component: HealthComponent
@onready var hitbox = $Hitbox

func take_damage(damage):
	var tween = get_tree().create_tween()
	tween.tween_property($"../AnimationComponent/Sprite2D", "modulate", Color(18.892, 18.892, 18.892, 1.0), 0.1)
	tween.chain().tween_property($"../AnimationComponent/Sprite2D", "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.1)
	
	health_component.damage(damage)

func disable_collision():
	hitbox.set_deferred("disabled", true)

func enable_collision():
	hitbox.set_deferred("disabled", false)
