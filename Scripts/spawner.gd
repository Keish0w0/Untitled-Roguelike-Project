extends Node2D

##REFERECES
@export var player_ref: Player
@export var enemy: PackedScene

@export var distance: float = 300

@export var enemy_types: Array[Enemy]

var minute: int
var second: int:
	set(value):
		second = value
		if second >= 60:
			second -= 60
			minute += 1

func spawn(pos: Vector2):
	var enemy_instance = enemy.instantiate()
	
	enemy_instance.type = enemy_types[min(minute, enemy_types.size()-1)]
	enemy_instance.position = pos
	enemy_instance.player_ref = player_ref
	
	get_tree().current_scene.add_child(enemy_instance)

func get_random_position():
	var vpr = get_viewport_rect().size * randf_range(1.1,1.4)
	var top_left = Vector2(player_ref.global_position.x - vpr.x/2, player_ref.global_position.y - vpr.y/2)
	var top_right = Vector2(player_ref.global_position.x + vpr.x/2, player_ref.global_position.y - vpr.y/2)
	var bottom_left = Vector2(player_ref.global_position.x - vpr.x/2, player_ref.global_position.y + vpr.y/2)
	var bottom_right = Vector2(player_ref.global_position.x + vpr.x/2, player_ref.global_position.y + vpr.y/2)
	var pos_side = ["up","down","right","left"].pick_random()
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
	
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y, spawn_pos2.y)
	return Vector2(x_spawn, y_spawn)

func circle_pattern() -> Vector2:
	return player_ref.position + distance * Vector2.RIGHT.rotated(randf_range(0, 2 * PI))

func amount(number: int = 1):
	for i in range(number):
		spawn(get_random_position())

func _on_timer_timeout() -> void:
	second += 1
	%Clock.text = str(minute).lpad(2, '0') + " : " + str(second).lpad(2, '0') 
	amount((minute % 10)+1) 

func _on_pattern_timeout() -> void:
	for i in range(50):
		spawn(circle_pattern())
