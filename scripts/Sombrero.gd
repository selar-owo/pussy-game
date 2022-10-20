extends StaticBody2D

#orneyadaduj variabl
onready var label = get_node("Label")
onready var sprite = get_node("Sprite")
onready var save_file = SaveFile.game_data
onready var playBuy = get_node("buyNoise")

#bvariable
var completed = preload("res://sprites/hatTopBuy.png")
var isHover = false

func _ready():
	#top like save file loadign hit
	if save_file.sombrero == false:
		label.show()
	elif save_file.sombrero == true:
		label.get("custom_fonts/font").size = 40
		label.text = "BOUGHT"

#IS IT HOVERING
func _on_Area2D_mouse_entered():
	isHover = true
func _on_Area2D_mouse_exited():
	isHover = false

#poopcess LOL
func _process(delta):
	#buy da upgrae
	if Input.is_action_just_pressed("mousebutton") and isHover == true and save_file.sombrero == false and save_file.goobs >= 10000:
		save_file.sombrero = true
		label.get("custom_fonts/font").size = 40
		label.text = "BOUGHT"
		save_file.goobs -= 10000
		save_file.goobPerClick += 2
		playBuy.play()
		SaveFile.save_data()
