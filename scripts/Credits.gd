extends Node2D

var menu = load("res://scenes/Menu.tscn")
var clickOnVersion = 0
onready var save_file = SaveFile.game_data

func _on_exit_button_up():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_selar_button_down():
	OS.shell_open("https://selar.itch.io")

func _on_visoe_button_up():
	OS.shell_open("https://twitter.com/vis0e")

func _on_whiteout_button_up():
	OS.shell_open("https://twitter.com/whiteoutlmao")

func _on_kriz_button_up():
	OS.shell_open("www.google.com/search?q=shrug&hs=4gs&tbm=isch&sxsrf=ALiCzsaSFCUY1y2phXWL3KmK-3gC8x_qZA:1666107413694&source=lnms&sa=X&ved=0ahUKEwiJrrPkjer6AhU3QfEDHff8CjIQ_AUI8ggoAQ#imgrc=8bCv6MQrmC8DXM")
func _on_version_button_up():
	clickOnVersion += 1
	print(clickOnVersion)
	if clickOnVersion >= 10:
		save_file.catType = 400
