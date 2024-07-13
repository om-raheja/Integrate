extends RigidBody3D

var last_velocity = Vector3.ZERO

func _ready():
	self.contact_monitor = true
	self.max_contacts_reported = 5
	
	connect("body_entered", Callable(self, "_on_body_entered"))

func _integrate_forces(state):
	# Capture the velocity just before collision
	last_velocity = state.get_linear_velocity()
	print("no", last_velocity)
	


func _on_body_entered(body):
	if body is StaticBody3D:
		print("Box hit the floor")
		##var window_dialog = get_node("/Control/Window")
		#var label = get_node("/Control/Window/Label")
		
		# Show the window dialog and set the text
		#window_dialog.show()
		#	label.text = "Velocity before collision: " + str(last_velocity)
		# Optionally, you might want to pause the simulation
