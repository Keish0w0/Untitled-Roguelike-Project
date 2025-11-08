extends TextureButton

@export var item : Items:
	set(value):
		item = value
		
		texture_normal = value.icon
		$Label.text = "LV " + str(item.level + 1)
		$Description.text = value.upgrades[value.level - 1].description

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and item:
		print(item.title)
		item.upgrade_item()
		get_parent().close_option()
