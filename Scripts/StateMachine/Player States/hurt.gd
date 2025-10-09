class_name Hurt extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	#print("Current State: HURT")
	player.anim.hurt()

func end_state():
	#STATE TRANSITION
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	else : transition.emit(RUNNING)
