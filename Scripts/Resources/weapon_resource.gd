class_name Weapons extends Resource

@export var title : String
@export var texture : Texture2D
@export var icon : Texture2D

#PROJECTILE PROPERTIES
@export var damage : float
@export var cooldown : float
@export var speed : float
@export var pierce_limit : float

@export var type : String

@export var projectile_node : PackedScene = preload("res://Scenes/Item Functions/projectile.tscn")

@export var upgrades : Array[Upgrade]
var level = 1

func activate(_source, _staff, _target, _scene_tree): pass

func is_upgradable() -> bool:
	if level <= upgrades.size():
		return true
	return false

func upgrade_item():
	if not is_upgradable():
		return
	
	var upgrade = upgrades[level - 1]
	
	damage += upgrade.damage
	cooldown += upgrade.cooldown
