class_name AnimationComponent extends Node2D

@onready var anim_player = $EnemySprite/AnimationPlayer

func run(): anim_player.play("run")

func hit_flash():
	var tween = get_tree().create_tween()
	tween.tween_property($EnemySprite, "modulate", Color(9.149, 9.149, 9.149, 1.0), 0.1)
	tween.chain().tween_property($EnemySprite, "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.1)
