class_name Dash extends PlayerState

@export var stamina_component: StaminaComponent
@onready var dash_cooldown = $DashCooldown
@onready var i_frames = $iFrames

func enter(_previous_state_path: String, _data := {}) -> void:
	#print("Current State: DASH")
	player.can_dash = false
	
	#DASH ANIMATION
	player.anim_sprite.play("dash")
	
	#I-FRAMES
	player.is_dashing = true
	i_frames.start()
	
	#DASH COOLDOWN
	dash_cooldown.start()
	
	#COLLISION
	%Hitbox.set_deferred("disabled", true)
	
	#DASH SCRIPT
	player.velocity = player.velocity.lerp(player.input * player.dash_speed, 1)

	#STAMINA
	stamina_component.use_stamina(player.dash_stamina)
	stamina_component.stamina_regen = false
	if stamina_component.stamina <= 0:
		stamina_component.stamina = 0
	print("Stamina: " + str(stamina_component.stamina))
	stamina_component.stamina_cooldown.start()

func _dash_cooldown_timeout() -> void:
	player.can_dash = true
	
func _on_i_frames_timeout() -> void:
	player.is_dashing = false
	%Hitbox.set_deferred("disabled", false)
	
	#STATE TRANSITION
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	else: transition.emit(RUNNING)
