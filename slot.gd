extends PanelContainer

@export var item : Items:
	set(value):
		item = value
		$TextureRect.texture = value.icon
		$Cooldown.wait_time = value.cooldown

func _ready() -> void: pass
	#var weapon = weapon_aim.instantiate()

func _on_cooldown_timeout() -> void:
	if item:
		$Cooldown.wait_time = item.cooldown
		item.activate(owner, owner.staff, get_tree())
