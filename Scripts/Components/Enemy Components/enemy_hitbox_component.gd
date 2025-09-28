class_name EnemyHitboxComponent extends Area2D

@export var health_component: HealthComponent
@onready var collision = $CollisionShape2D

func take_damage(attack):
	health_component.damage(attack)
	disable_collision()

"""
func _on_body_entered(body: Node2D):
	if body.has_method("contact_damage"):
		take_damage(body.damage)
		disable_collision()
"""

func disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)

func enable_collision():
	$CollisionShape2D.set_deferred("disabled", false)
