extends Area2D

@export var player_ref: Player

var direction : Vector2 = Vector2.RIGHT
var speed : float = 200
var damage : float = 1
var type : String

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	#queue_free()
	if body.has_node("EnemyHitboxComponent"):
		body.hitbox.take_damage(damage)
		body.knockback = direction * 50

func _on_screen_exited() -> void:
	await get_tree().create_timer(5).timeout
	queue_free()
