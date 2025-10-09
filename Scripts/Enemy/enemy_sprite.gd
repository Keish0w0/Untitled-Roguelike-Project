extends Sprite2D

@onready var sprite : Sprite2D = $"."
@onready var collision_shape: CollisionShape2D = $"../../EnemyHitboxComponent/Hitbox"

func _ready(): 
	if sprite.texture:
		var sprite_height = sprite.texture.get_height()
	
		var current_extents = collision_shape.shape.extents
		collision_shape.shape.extents = Vector2(current_extents.x, sprite_height / 2.0)
