extends TextureButton

var shop = "res://scenes/ShopUI.tscn"

func _on_ShopButton_button_up():
	get_tree().change_scene(shop)
	print("enter shop")
	SaveFile.save_data()
