class_name PlayerScript extends CharacterBody2D

@export_subgroup("Player Movement")
@export var max_speed = 600
@export var accel = 5000
@export var friction = 1500

#Player Input
@export var input = Vector2.ZERO

#Player Animation
@onready var anim_sprite = $AnimatedSprite2D

func _physics_process(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else: 
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	
	#print(input.x)
	flip_sprite()
	move_and_slide()

func get_input():
	input.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	return input.normalized()
	
func flip_sprite():
	if input.x > 0: anim_sprite.flip_h = false
	elif input.x < 0: anim_sprite.flip_h = true
