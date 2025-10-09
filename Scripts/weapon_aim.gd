class_name WeaponAim extends Node2D
 
@onready var item : Items = $"../UI/Weapons/Slot1".item:
	set(value):
		item = value
		$Sprite2D.texture = value.texture

@onready var start : Marker2D = $Start

func _process(_delta: float) -> void:
	aiming()
	rotation()

func aiming():
	if $"..".auto_aim == true:
		if $"..".nearest_enemy:
			look_at($"..".nearest_enemy.position)
	elif $"..".auto_aim == false:
		look_at(get_global_mouse_position())

func rotation():
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
