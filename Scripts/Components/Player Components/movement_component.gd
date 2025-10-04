class_name MovementComponent extends Node2D
@onready var player : Player = $".."

var input = Vector2.ZERO

func _physics_process(delta: float) -> void:
	input = player.input
	var lerp_weight = delta * (player.accel if input else player.friction)
	player.velocity = player.velocity.lerp(input * player.max_speed, lerp_weight)

	#flip_sprite()
	player.move_and_slide()
