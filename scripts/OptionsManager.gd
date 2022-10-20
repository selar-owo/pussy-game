extends Node2D

onready var save_file = SaveFile.game_data
var menu = "res://scenes/Menu.tscn"
onready var golden = get_node("Goob3007")
onready var lock = get_node("Goob3007/Lock")
onready var lockLabel = get_node("Goob3007/GetGoobs")
onready var warning = get_node("Update/Label")
var goldCan = false

func _process(delta):
	get_node("Label").text = str("cat type: ", save_file.catType)
	if save_file.goobs >= 1000000:
		lock.hide()
		lockLabel.hide()
		goldCan = true
	else:
		lock.show()
		lockLabel.show()
		goldCan = false

func _on_exit_button_up():
	get_tree().change_scene(menu)


func _on_Erase_button_up():
	SaveFile.erase_data()
	get_tree().change_scene(menu)

func _on_Update_button_up():
	SaveFile.force_update_data()
	if save_file.UpdateChecker1 == "Success":
		warning.text = "Success!"

func _on_Goob1_button_up():
	save_file.catType = 1
func _on_Goob2_button_up():
	save_file.catType = 2
func _on_Goob3_button_up():
	save_file.catType = 3
func _on_Goob4_button_up():
	save_file.catType = 4
func _on_Goob5_button_up():
	save_file.catType = 5
func _on_Goob6_button_up():
	save_file.catType = 6
func _on_Goob400_button_up():
	save_file.goobPerClick = 2147483647
	save_file.goobPerSecond = 2147483647
	save_file.catType = 2147483647
func _on_Goob3007_button_up():
	if goldCan == true:
		save_file.catType = 3007


func _on_Music_toggled(button_pressed):
	pass # Replace with function body.
