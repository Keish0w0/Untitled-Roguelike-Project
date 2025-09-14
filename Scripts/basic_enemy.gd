extends CharacterBody2D

@export var player_ref: Player
@onready var anim_sprite = $AnimatedSprite2D
var max_speed = 350
var direction: Vector2

func _physics_process(delta: float) -> void:
	velocity = velocity.lerp((player_ref.position - position).normalized() * max_speed, 1)
	move_and_collide(velocity * delta)
	
	flip_sprite()

func flip_sprite():
	anim_sprite.flip_h = velocity.x < 0
