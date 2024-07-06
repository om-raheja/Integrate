extends RigidBody3D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is StaticBody3D:
		print("Box has hit the floor")
