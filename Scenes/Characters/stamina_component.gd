class_name StaminaComponent extends Node2D

@onready var player = $".."
@export var dash_state: Dash

##STAMINA
@export var max_stamina = 100
@export var stamina_regen_rate = 30
@onready var stamina_cooldown = $StaminaCooldown

var stamina:
	set(value):
		stamina = value
		$Stamina.value = value
var stamina_regen = false

func _ready() -> void:
	stamina = max_stamina

func _process(delta) -> void:
	if stamina_regen == true:
		stamina += stamina_regen_rate * delta
	
	if stamina >= max_stamina:
		stamina = max_stamina
		stamina_regen = false
		player.can_dash = true
	
	#STAMINA EXAUSTION
	if stamina <= 0:
		player.can_dash = false

func use_stamina(cost):
	stamina -= cost

func _on_stamina_cooldown_timeout() -> void:
	stamina_regen = true
