class_name InputComponent extends Node2D

signal attack
signal aim

var movement = Vector2.ZERO

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		emit_signal("attack")
	
	if Input.is_action_just_pressed("aim"):
		emit_signal("aim")

func _physics_process(_delta: float) -> void:
	movement = get_input()

func get_input():
	movement.x = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))
	movement.y = int(Input.get_action_strength("down")) - int(Input.get_action_strength("up"))
	return movement.normalized()
