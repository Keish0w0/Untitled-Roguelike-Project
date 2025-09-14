extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("Current State: DASH")
	#player.anim_sprite.play("dash")
	player.dash_cooldown.start()
	player.velocity = player.velocity.lerp(player.input * player.dash_speed, 1)

func _dash_cooldown_timeout() -> void:
	player.can_dash = true
	
	#STATE TRANSITION
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	else: transition.emit(RUNNING)
