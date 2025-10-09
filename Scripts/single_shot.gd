class_name SingleShot extends Items

func shoot(source, staff, target, scene_tree):
	if target == null:
		return
		
	var projectile = projectile_node.instantiate()
	
	projectile.type = type
	if projectile.type == "staff":
		projectile.global_position = staff.start.global_position
	else:
		projectile.position = source.position
		
	projectile.damage = damage
	projectile.speed = speed
	if source.auto_aim == true:
		projectile.direction = (target.position - source.position).normalized()
	elif source.auto_aim == false:
		projectile.direction = (staff.mouse_pos - source.position).normalized()
	scene_tree.current_scene.add_child(projectile)

func activate(source, staff, target, scene_tree):
	shoot(source, staff, target, scene_tree)
