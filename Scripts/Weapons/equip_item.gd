##ABSTRACT CLASS
class_name EquipItem extends Node2D

@export var use_rate : float = 0.5
var last_use_time : float
var aim_angle : float
var owner_char : CharacterBody2D
var can_use : bool = false

func _process(delta: float) -> void:
	global_rotation = lerp_angle(global_rotation, aim_angle, 40 * delta)

func _set_aim_direction(aim_dir: Vector2):
	aim_angle = aim_dir.angle()
	
func _equip():
	pass

func _unequip():
	pass

func _try_use() -> bool:
	if not can_use:
		return false
	
	#if not enough time has elapsed between the last time the item is used
	if Time.get_unix_time_from_system() - last_use_time < use_rate:
		return false
	
	last_use_time = Time.get_unix_time_from_system()
	_use()
	
	return true

func _use():
	pass
