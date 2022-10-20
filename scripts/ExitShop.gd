extends TextureButton

var menu = "res://scenes/MainWorld.tscn"

func _on_ExitShop_button_up():
	get_tree().change_scene(menu)
	print("exit shop")
	SaveFile.save_data()
