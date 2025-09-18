class_name HitboxComponent extends Area2D

@export var health_component: HealthComponent

func damage(attack):
	if health_component:
		health_component.damage(attack)

func _on_body_entered(area: Node2D):
	if area.has_method("contact_damage"):
		health_component.damage(area.damage)
