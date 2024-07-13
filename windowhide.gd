extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", Callable(self, "_on_pressed"))
	
func _on_pressed():
	#$Control/Prompt.hide()
	#$Control/GGButton.show()
	if ($/root/Node3D/Control/Prompt/VBoxContainer/LineEdit.text == "13"):
		$/root/Node3D/Control/Prompt.hide()
		$/root/Node3D/Control/GGButton.show()
