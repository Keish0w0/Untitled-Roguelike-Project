class_name HitboxComponent extends Area2D

signal took_damage

@export var health_component: HealthComponent
@export var animation_component: PlayerAnimationComponent
@onready var hitbox = $Hitbox
@onready var dmg_cooldown = $DamageCooldown

var cooldown_dmg : bool = false

func take_damage(attack):
	owner.frame_freeze(0.0, 0.25)
	animation_component.hit_flash()
	health_component.damage(attack)
	disable_collision()
	emit_signal("took_damage")
	
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("contact_damage"):
		take_damage(body.damage)

func _on_damage_cooldown_timeout() -> void:
	if $"..".is_dashing != true:
		enable_collision()

func disable_collision():
	hitbox.set_deferred("disabled", true)
	dmg_cooldown.start()

func enable_collision():
	hitbox.set_deferred("disabled", false)
