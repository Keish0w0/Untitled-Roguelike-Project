extends Area2D

@onready var player_ref: Player = $"../Player"
var direction : Vector2 = Vector2.RIGHT
var speed : float = 200
var damage : float = 1
var type : String
var pierce_count : float = 0
var pierce_limit : float = 1
var crit : bool

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	pierce_count += 1
	
	if pierce_count >= pierce_limit:
		queue_free()
	
	if body.has_node("EnemyHitboxComponent"):
		if crit: 
			damage *= 1.5
			print("CRITICAL HIT!")
		body.hitbox.take_damage(damage)
		body.knockback = direction * 50

func _on_screen_exited() -> void:
	await get_tree().create_timer(5).timeout
	queue_free()
