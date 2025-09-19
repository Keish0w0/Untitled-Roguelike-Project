class_name HitboxComponent extends Area2D

@export var health_component: HealthComponent
@onready var collision = $CollisionShape2D

func damage(attack):
	if health_component:
		health_component.damage(attack)
		disable_collision()

func _on_body_entered(area: Node2D):
	if area.has_method("contact_damage"):
		health_component.damage(area.damage)
		disable_collision()

func disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)
	print("disabled")

func enable_collision():
	$CollisionShape2D.set_deferred("disabled", false)
	print("enabled")
