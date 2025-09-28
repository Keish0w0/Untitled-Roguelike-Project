extends CharacterBody2D

@export var player_ref: Player
#@onready var anim_sprite = $AnimatedSprite2D
var max_speed: float = 350
var direction: Vector2
var damage: float

var type: Enemy:
	set(value):
		type = value
		$Sprite2D.texture = value.texture
		damage = value.damage
		#max_speed = value.speed

func _physics_process(delta: float) -> void:
	velocity = velocity.lerp((player_ref.position - position).normalized() * max_speed, 1)
	move_and_collide(velocity * delta)
	
	flip_sprite()

func flip_sprite():
	$Sprite2D.flip_h = velocity.x < 0

func contact_damage(): pass
