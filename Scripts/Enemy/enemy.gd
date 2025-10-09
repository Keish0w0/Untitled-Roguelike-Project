class_name Enemy extends CharacterBody2D

@export var player_ref: Player
var max_speed: float
var damage: float
var knockback: Vector2
var seperation: float

##REFERENCES
@onready var hitbox = $EnemyHitboxComponent

var type: EnemyResource:
	set(value):
		type = value
		$AnimationComponent/EnemySprite.texture = value.texture
		damage = value.damage
		max_speed = value.speed

var is_visible_on_screen = false

func _physics_process(delta: float) -> void:
	check_seperation(delta)
	knockback_update(delta)
	
	#ANIMATION
	flip_sprite()
	$AnimationComponent.run()

func check_seperation(_delta):
	seperation = (player_ref.position - position).length()
	if seperation >= 1000:
		queue_free()
	
	if seperation < player_ref.nearest_enemy_distance:
		if is_visible_on_screen == true:
			player_ref.nearest_enemy = self

func knockback_update(delta):
	#MOVEMENT
	velocity = (player_ref.position - position).normalized() * max_speed
	knockback = knockback.move_toward(Vector2.ZERO, 1)
	velocity += knockback
	var collider = move_and_collide(velocity * delta)
	if collider:
		collider.get_collider().knockback = (collider.get_collider().global_position - global_position).normalized() * 35

func flip_sprite():
	$AnimationComponent/EnemySprite.flip_h = global_position.direction_to(player_ref.global_position).x < 0

func _on_screen_entered() -> void:
	is_visible_on_screen = true

func _on_screen_exited() -> void:
	is_visible_on_screen = false
	
func contact_damage(): pass
