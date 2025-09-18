class_name StaminaComponent extends Node2D

##STAMINA
@export var max_stamina = 100
@export var stamina_regen_rate = 30
@onready var stamina_cooldown = $StaminaCooldown
var stamina:
	set(value):
		stamina = value
		$"../Stamina".value = value
var stamina_regen = false

func _ready() -> void:
	stamina = max_stamina

func _process(delta) -> void:
	if stamina_regen == true:
			stamina += stamina_regen_rate * delta
	
	if stamina >= max_stamina:
		stamina = max_stamina
		stamina_regen = false
		#can_dash = true
	
	#STAMINA EXAUSTION
	if stamina <= 0: pass
		#can_dash = false

func _on_stamina_cooldown_timeout() -> void:
	stamina_regen = true
