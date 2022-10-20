extends Node2D

var game = "res://scenes/MainWorld.tscn"
var options = "res://scenes/Options.tscn"
onready var sprite = get_node("Title")
var goob1 = preload("res://sprites/titles/title.png")
var goob2 = preload("res://sprites/titles/title2.png")
var goob3 = preload("res://sprites/titles/title3.png")
var goob4 = preload("res://sprites/titles/title4.png")
var goob5 = preload("res://sprites/titles/title5.png")
var goob6 = preload("res://sprites/titles/title6.png")
var goob400 = preload("res://sprites/titles/title400.png")
var menutheme = preload("res://sounds/thegoofiestbeatLOOPED.mp3")
onready var music = get_node("goofyahhbeat")
onready var save_file = SaveFile.game_data
onready var title = get_node("Title/AnimationPlayer")
onready var sombrero = get_node("Title/Sombrero")
onready var elsondito = get_node("elsondito")


func _ready():
	if SaveFile.game_data.catType == 1:
		sprite.set_texture(goob1)
	elif SaveFile.game_data.catType == 2:
		sprite.set_texture(goob2)
	elif SaveFile.game_data.catType == 3:
		sprite.set_texture(goob3)
	elif SaveFile.game_data.catType == 4:
		sprite.set_texture(goob4)
	elif SaveFile.game_data.catType == 5:
		sprite.set_texture(goob5)
	elif SaveFile.game_data.catType == 6:
		sprite.set_texture(goob6)
	elif SaveFile.game_data.catType == 400:
		sprite.set_texture(goob400)
	title.play("New Anim")
	
	if save_file.sombrero == false:
		sombrero.hide()
		music.play()
	elif save_file.sombrero == true:
		sombrero.show()
		elsondito.play()

func _on_OptionsButton_button_up():
	get_tree().change_scene(options)

func _on_Fader_finished():
	get_tree().change_scene(game)

func _on_info_button_up():
	get_tree().change_scene("res://scenes/Credits.tscn")
