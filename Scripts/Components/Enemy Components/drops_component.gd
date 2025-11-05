class_name DropsComponent extends Node2D

@onready var enemy : CharacterBody2D = $".."

func drop_item():
	if enemy.type.drops.size() == 0:
		return
	
	var item = enemy.type.drops.pick_random()
	
	var item_to_drop = enemy.drop.instantiate()
	
	item_to_drop.type = item
	item_to_drop.position = enemy.position
	item_to_drop.player_ref = enemy.player_ref
	
	get_tree().current_scene.call_deferred("add_child", item_to_drop)
