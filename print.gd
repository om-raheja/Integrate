extends RigidBody3D

var last_velocity = Vector3.ZERO

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

	set_collision_layer(1)
	set_collision_mask(1)

func _integrate_forces(state):
	# Capture the velocity just before collision
	last_velocity = state.get_linear_velocity()
	print("no", last_velocity)
	
	# Check for collisions
	print(state.get_contact_count())

func _on_body_entered(body):
	print("wut")
	if body is StaticBody3D:
		print("Box has hit the floor")
		var window_dialog = get_node("/root/Node3D/Control/WindowDialog")
		var label = window_dialog.get_node("Label")
		
		# Show the window dialog and set the text
		window_dialog.show()
		label.text = "Velocity before collision: " + str(last_velocity)
		# Optionally, you might want to pause the simulation
