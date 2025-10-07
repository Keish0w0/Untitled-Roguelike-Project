extends CharacterBody2D

@export var player_ref: Player
var max_speed: float
var direction: Vector2
var damage: float

var type: Enemy:
	set(value):
		type = value
		$AnimationComponent/Sprite2D.texture = value.texture
		damage = value.damage
		max_speed = value.speed
	

func _physics_process(delta: float) -> void:
	velocity = velocity.lerp((player_ref.position - position).normalized() * max_speed, 1)
	move_and_collide(velocity * delta)
	flip_sprite()
	$AnimationComponent.run()

func flip_sprite():
	$AnimationComponent/Sprite2D.flip_h = velocity.x < 0

func contact_damage(): pass
