extends TextureButton

@export var weapon : Weapons:
	set(value):
		weapon = value
		
		texture_normal = value.icon
		$Label.text = "LV " + str(weapon.level + 1)
		$Description.text = value.upgrades[value.level - 1].description

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and weapon:
		print(weapon.title)
		weapon.upgrade_item()
		get_parent().close_option()
