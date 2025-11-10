class_name XPComponent extends Node2D

@onready var player_ref : CharacterBody2D = $".."

var XP : int = 0:
	set(value): 
		XP = value
		%XP.value = value
var total_XP : int = 0

var level : int = 0:
	set(value): 
		level = value
		%Level.text = "LV " + str(value)
		%Options.show_option()

func _process(_delta) -> void:
	check_xp()

func gain_xp(amount):
	XP += amount * player_ref.exp_gain
	total_XP += amount * player_ref.exp_gain

func check_xp():
	if XP >= %XP.max_value:
		XP -= %XP.max_value
		level += 1
		
		if level >= 3:
			%XP.max_value += 2
		elif level >= 11:
			%XP.max_value += 5

func _on_magnet_area_entered(area: Area2D) -> void:
	if area.has_method("follow"):
		area.follow(player_ref)
