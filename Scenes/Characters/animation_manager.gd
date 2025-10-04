extends Node2D

##REFERENCES
@onready var player = $".."
@onready var anim_player = $Sprite2D/AnimationPlayer
@onready var player_sprite = $Sprite2D

func _process(delta: float) -> void:
	flip_sprite()

func flip_sprite():
	if player.input.x != 0:
		player_sprite.flip_h = player.input.x < 0

func idle(): anim_player.play("idle")
func run(): anim_player.play("run")
func dodge(): anim_player.play("dodge")
func hurt(): anim_player.play("hurt")
func death(): anim_player.play("death")
