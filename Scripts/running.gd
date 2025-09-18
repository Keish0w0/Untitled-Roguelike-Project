class_name Running extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void: pass
	#print("Current State: RUNNING")

func physics_update(_delta: float) -> void:
	#RUNNING ANIMATION
	if player.velocity:
		player.anim_sprite.play("running")
		player.anim_sprite.speed_scale = (player.velocity/player.max_speed).distance_to(Vector2.ZERO) + 0.5

	#STATE TRANSITION
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	if Input.is_action_just_pressed("dash") and player.can_dash == true:
		transition.emit(DASH)
