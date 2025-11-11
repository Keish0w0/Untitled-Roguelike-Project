extends VBoxContainer

@export var weapons : HBoxContainer
@export var passive_items : HBoxContainer
var OptionSlot = preload("res://Scenes/Item Functions/option_slot.tscn")

func _ready() -> void:
	hide()

func close_option():
	hide()
	get_tree().paused = false

func get_available_resource(items) -> Array[Item]:
	var resources : Array[Item] = []
	for item in items.get_children():
		if item.item != null:
			resources.append(item.item)
	return resources

func add_option(item) -> int:
	if item.is_upgradable():
		var option_slot = OptionSlot.instantiate()
		option_slot.item = item
		add_child(option_slot)
		return 1
	return 0 

func show_option():
	var weapons_available = get_available_resource(weapons) 
	var passives_available = get_available_resource(passive_items) 
	if weapons_available.size() == 0 and passives_available.size() == 0:
		return
	
	for slot in get_children():
		slot.queue_free()
	
	var option_size = 0
	for weapon in weapons_available:
		option_size += add_option(weapon)
	
	for passive in passives_available:
		option_size += add_option(passive)
	
	if option_size == 0:
		return
	
	show()
	get_tree().paused = true
