class_name Player extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed = 650
@export var accel = 6
@export var friction = 8
@export var dash_speed = max_speed * 3.5
"""
##STAMINA
@export var max_stamina = 100
@export var stamina_regen_rate = 30
@onready var stamina_cooldown = $StaminaCooldown
var stamina:
	set(value):
		stamina = value
		$Stamina.value = value
var stamina_regen = false
"""
##DASH
@onready var dash_cooldown = $DashCooldown
@onready var i_frames = $iFrames
@onready var dash_stamina = 25
var can_dash = true
var is_dashing = false

##PLAYER INPUT
var input = Vector2.ZERO

##PLAYER ANIMATION
@onready var anim_sprite = $Player

##OTHER REFERENCES
@onready var dmg_cooldown = $DamageCooldown
#a@onready var collision = $PlayerCollision



func _physics_process(delta: float) -> void:
	#MOVEMENT SCRIPT
	input = get_input()
	var lerp_weight = delta * (accel if input else friction)
	velocity = velocity.lerp(input * max_speed, lerp_weight)
	
	

	flip_sprite()
	move_and_slide()

#STAMINA REGEN
func _process(delta) -> void: pass
"""
	if stamina_regen == true:
		stamina += stamina_regen_rate * delta
	
	if stamina >= max_stamina:
		stamina = max_stamina
		stamina_regen = false
		can_dash = true
"""
func get_input():
	input.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	return input.normalized()
#MOVEMENT SCRIPT

func flip_sprite():
	anim_sprite.flip_h = input.x < 0
"""
func take_damage(amount):
	if !is_dashing:
		health -= amount


#TAKE DAMAGE IF ENEMY TOUCHED PLAYER
func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_method("contact_damage"):
		take_damage(body.damage)
		dmg_cooldown.start()
		%Collision.set_deferred("disabled", true)
"""
func _on_damage_cooldown_timeout() -> void:
	%Collision.set_deferred("disabled", false)
	
