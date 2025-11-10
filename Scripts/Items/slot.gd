extends PanelContainer

@export var weapon : Weapons:
	set(value):
		weapon = value
		$TextureRect.texture = value.icon
		$Cooldown.wait_time = value.cooldown

func _ready() -> void: pass
	#var weapon = weapon_aim.instantiate()

func _on_cooldown_timeout() -> void:
	if weapon:
		$Cooldown.wait_time = weapon.cooldown
		weapon.activate(owner, owner.staff, owner.nearest_enemy, get_tree())
