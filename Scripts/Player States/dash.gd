class_name Dash extends PlayerState

@export var stamina_component: StaminaComponent
@export var hitbox_component: HitboxComponent
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
	hitbox_component.disable_collision()
	
	#DASH SCRIPT
	player.velocity = player.velocity.lerp(player.input * player.dash_speed, 1)

	#STAMINA
	stamina_component.use_stamina(player.dash_stamina)
	

func _dash_cooldown_timeout() -> void:
	player.can_dash = true
	
func _on_i_frames_timeout() -> void:
	player.is_dashing = false
	hitbox_component.enable_collision()
	
	#STATE TRANSITION
	if player.input == Vector2.ZERO:
		transition.emit(IDLE)
	else: transition.emit(RUNNING)
