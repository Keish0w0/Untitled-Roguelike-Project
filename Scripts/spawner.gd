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

func get_random_pos() -> Vector2:
	return player_ref.position + distance * Vector2.RIGHT.rotated(randf_range(0, 2 * PI))

func amount(number: int = 1):
	for i in range(number):
		spawn(get_random_pos())

func _on_timer_timeout() -> void:
	second += 1
	%Second.text = str(second).lpad(2, '0')
	%Minute.text = str(minute).lpad(2, '0')
	amount((minute % 10)+1) 

func _on_pattern_timeout() -> void:
	for i in range(50):
		spawn(get_random_pos())
