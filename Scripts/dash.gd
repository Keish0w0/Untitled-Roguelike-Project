extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("Current State: DASH")
	player.anim_sprite.play("dash")
	
	#I-FRAMES
	player.is_dashing = true
	player.i_frames.start()
	
	player.dash_cooldown.start()
	player.velocity = player.velocity.lerp(player.input * player.dash_speed, 1)
	

func physics_update(_delta: float) -> void:
	pass
	
func _dash_cooldown_timeout() -> void:
	player.can_dash = true
	
func _on_i_frames_timeout() -> void:
	player.is_dashing = false
	
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	else: transition.emit(RUNNING)
