class_name SingleShot extends Items

func shoot(source, staff, scene_tree):
	
	var projectile = projectile_node.instantiate()
	
	#projectile.player_ref = 
	projectile.type = type
	if projectile.type == "staff":
		projectile.global_position = staff.start.global_position
	else:
		projectile.position = source.position
	projectile.damage = damage
	projectile.speed = speed
	#projectile.rotation = 
	
	scene_tree.current_scene.add_child(projectile)

func activate(source, staff, scene_tree):
	shoot(source, staff, scene_tree)
