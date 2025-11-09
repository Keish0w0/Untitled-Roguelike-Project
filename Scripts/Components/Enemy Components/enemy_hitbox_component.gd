class_name EnemyHitboxComponent extends Area2D

@export var health_component: EnemyHealthComponent
@export var animation_component: AnimationComponent
@onready var hitbox : CollisionShape2D = $Hitbox
@onready var parent : CharacterBody2D = $".."

var crit : bool

func take_damage(damage):
	var dmg = damage
	crit = critical(parent.player_ref.crit_chance)
	if crit: 
			dmg *= 1.5
	
	animation_component.hit_flash()
	parent.damage_popup(dmg, crit)
	health_component.damage(dmg)

func disable_collision():
	hitbox.set_deferred("disabled", true)

func enable_collision():
	hitbox.set_deferred("disabled", false)

func critical(crit_chance: float) -> bool:
	var random_roll = randf() 
	print(random_roll)

	if random_roll < crit_chance:
		return true
	else:
		return false
