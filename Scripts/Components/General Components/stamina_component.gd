class_name StaminaComponent extends Node2D

@onready var player = $".."
@export var dash_state: Dash

##STAMINA
@export var max_stamina : float = 100
@export var stamina_recovery : float = 4.5

@onready var stamina_cooldown = $StaminaCooldown

var stamina:
	set(value):
		stamina = value
		$Stamina.value = value
var stamina_regen : bool = false

func _ready() -> void:
	stamina = max_stamina

func _process(_delta) -> void:
	if stamina >= max_stamina:
		stamina = max_stamina
		stamina_regen = false
		player.can_dash = true
	
	#STAMINA EXAUSTION
	if stamina <= 0:
		player.can_dash = false

func use_stamina(cost):
	stamina -= cost
	
	stamina_regen = false
	
	if stamina <= 0:
		stamina = 0
	print("Stamina: " + str(stamina))
	
	stamina_cooldown.start()

func _on_stamina_cooldown_timeout() -> void:
	stamina_regen = true

func _on_stamina_timer_timeout() -> void:
	if stamina_regen == true:
		stamina += stamina_recovery
