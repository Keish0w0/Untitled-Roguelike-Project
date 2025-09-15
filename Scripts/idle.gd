extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	#print("Current State: IDLE")
	
	#IDLE ANIMATION
	player.anim_sprite.play("idle")

func physics_update(_delta: float) -> void:
	#STATE TRANSITION
	if player.input != Vector2.ZERO:
		transition.emit(RUNNING)
