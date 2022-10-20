extends TextureButton

var mainMenu = preload("res://scenes/Menu.tscn")

func _on_LeaveBITCH_button_up():
	Globals.MainMenu = true
	get_tree().change_scene("res://scenes/Menu.tscn")
