class_name Idle extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	#print("Current State: IDLE")
	player.anim.idle()

func physics_update(_delta: float) -> void:
	#STATE TRANSITION
	if player.input != Vector2.ZERO:
		transition.emit(RUNNING)

func _took_damage() -> void:
	transition.emit(HURT)
