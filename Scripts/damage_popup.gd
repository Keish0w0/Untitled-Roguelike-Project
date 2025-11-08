extends Label

func _ready() -> void: pop()

func pop():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", self.position + Vector2(0, -10), 0.2)
	tween.parallel().tween_property(self, "scale", Vector2(1.2,1.2), 0.2)
	tween.chain().tween_property(self, "scale", Vector2(0.5,0.5), 0.2)
	await tween.finished
	queue_free()
