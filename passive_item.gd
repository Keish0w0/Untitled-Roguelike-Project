class_name PassiveItem extends Item

@export var upgrades : Array[Stats]
var player_ref

func is_upgradable() -> bool:
	if level <= upgrades.size():
		return true
	return false

func upgrade_item():
	if not is_upgradable():
		return
	
	if player_ref == null:
		return
	
	var upgrade = upgrades[level - 1]

	player_ref.max_health += upgrade.max_health
	player_ref.health_recovery += upgrade.stamina_recovery
	player_ref.max_speed += upgrade.max_speed
	player_ref.stamina_recovery += upgrade.stamina_recovery
	player_ref.crit_chance += upgrade.crit_chance
	player_ref.exp_gain += upgrade.exp_gain
	player_ref.pickup_radius += upgrade.pickup_radius
	
	level += 1
