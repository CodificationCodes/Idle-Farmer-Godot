extends Button

func _ready():
	connect("pressed", _on_main_menu_pressed)
	self.focus_mode = Control.FOCUS_NONE
	
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")  # Make sure this path is correct
