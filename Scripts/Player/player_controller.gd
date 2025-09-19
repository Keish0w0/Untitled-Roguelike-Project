class_name PlayerController extends Node2D

@export_subgroup("Player Movement")
@export var max_speed = 650
@export var accel = 6
@export var friction = 8
@export var dash_speed = max_speed * 3.5

##PLAYER INPUT
var input = Vector2.ZERO

func get_input():
	input.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	input.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	return input.normalized()
