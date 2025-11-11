class_name WeaponAim extends Node2D
 
@onready var weapon : Weapons = $"../UI/Weapons/Slot1".item:
	set(value):
		weapon = value
		$Sprite2D.texture = value.texture

@onready var start : Marker2D = $Start
var mouse_pos : Vector2

func _process(_delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	aiming()
	rotation()

func aiming():
	if $"..".auto_aim == true:
		if $"..".nearest_enemy:
			look_at($"..".nearest_enemy.position)
		elif !$"..".nearest_enemy:
			$".".rotation = 0
	elif $"..".auto_aim == false:
		look_at(mouse_pos)

func rotation():
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
