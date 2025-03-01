extends TextureButton

@export var fishbone_scene: PackedScene  # Assign "Fishbone.tscn" in the Inspector
@export var spawn_y: int = -50  # Spawn fishbones slightly above the screen

func _on_pressed():
	# Existing tween effect for the button
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).set_delay(0.1)
	
	# Spawn a fishbone when clicked
	spawn_fishbone()

func spawn_fishbone():
	if fishbone_scene:
		var fishbone = fishbone_scene.instantiate()
		var viewport = get_viewport_rect()  # Get screen size
		
		# Set a random X position within screen limits
		var margin = 50  # Prevent spawning too close to edges
		var spawn_x = randf_range(margin, viewport.size.x - margin)
		
		fishbone.position = Vector2(spawn_x, spawn_y)
		fishbone.scale = Vector2(0.05, 0.05)  # Make it small
		fishbone.rotation_degrees = randf_range(0, 360)  # Random rotation

		# Add it to the scene
		get_tree().current_scene.add_child(fishbone)
		
		# Make it fall down
		var fall_tween = get_tree().create_tween()
		fall_tween.tween_property(fishbone, "position", Vector2(fishbone.position.x, viewport.size.y + 50), 1.5).set_trans(Tween.TRANS_LINEAR)

		# Queue free after falling
		fall_tween.tween_callback(fishbone.queue_free)
