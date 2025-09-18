extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	#print("Current State: DASH")
	player.can_dash = false
	
	#DASH ANIMATION
	player.anim_sprite.play("dash")
	
	#I-FRAMES
	player.is_dashing = true
	player.i_frames.start()
	
	#DASH COOLDOWN
	player.dash_cooldown.start()
	
	#COLLISION
	player.collision.set_deferred("disabled", true)
	
	#DASH SCRIPT
	player.velocity = player.velocity.lerp(player.input * player.dash_speed, 1)

func _dash_cooldown_timeout() -> void:
	player.can_dash = true
	
func _on_i_frames_timeout() -> void:
	player.is_dashing = false
	player.collision.set_deferred("disabled", false)
	
	#STATE TRANSITION
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	else: transition.emit(RUNNING)
