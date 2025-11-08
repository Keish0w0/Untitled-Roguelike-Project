extends VBoxContainer

@export var items : HBoxContainer
var OptionSlot = preload("res://Scenes/Item Functions/option_slot.tscn")

func _ready() -> void:
	hide()

func close_option():
	hide()
	get_tree().paused = false

func get_available_items():
	var item_resource = []
	for item in items.get_children():
		if item.item != null:
			item_resource.append(item.item)
	return item_resource

func show_option():
	var items_available = get_available_items()
	if items_available.size() == 0:
		return
	
	for slot in get_children():
		slot.queue_free()
	
	var option_size = 0
	for item in items_available:
		if item.is_upgradable():
			var option_slot = OptionSlot.instantiate()
			option_slot.item = item
			add_child(option_slot)
			option_size += 1
	
	if option_size == 0:
		return
	
	show()
	get_tree().paused = true
