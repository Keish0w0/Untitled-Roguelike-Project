class_name AnimationComponent extends Node2D

@onready var anim_player = $Sprite2D/AnimationPlayer

func run(): anim_player.play("run")
