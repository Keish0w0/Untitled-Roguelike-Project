class_name Items extends Resource

@export var title : String
@export var texture : Texture2D
@export var icon : Texture2D

#PROJECTILE PROPERTIES
@export var damage : float
@export var cooldown : float
@export var speed : float
@export var piercing : float

@export var type : String

@export var projectile_node : PackedScene = preload("res://Scenes/Items/projectile.tscn")

func activate(_source, _staff, _scene_tree): pass
