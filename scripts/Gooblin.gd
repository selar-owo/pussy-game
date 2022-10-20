extends StaticBody2D

#onready variable
onready var label = get_node("Label")
onready var sprite = get_node("Sprite")
onready var save_file = SaveFile.game_data
onready var playBuy = get_node("buyNoise")

#variable
var awesome = preload("res://sprites/gamerphonekitty.png")
var isHover = false

#ready function
func _ready():
	#load savefile
	if save_file.headphones == 0:
		label.show()
	elif save_file.headphones == 1:
		label.text = str("""cost 500
		it give +2 per click""");
		sprite.set_texture(awesome)
	elif save_file.headphones == 2:
		label.get("custom_fonts/font").size = 40
		label.text = "BOUGHT"
		sprite.set_texture(awesome)

#isHover
func _on_Area2D_mouse_entered():
	isHover = true
func _on_Area2D_mouse_exited():
	isHover = false

#process function
func _process(delta):
	#buy upgrade
	if Input.is_action_just_pressed("mousebutton") and isHover == true and save_file.headphones == 0 and save_file.goobs >= 100:
		save_file.headphones = 1
		save_file.goobPerClick += 1
		label.text = str("""cost 500
		it give +2 per click""");
		sprite.set_texture(awesome)
		save_file.goobs -= 100
		playBuy.play()
		SaveFile.save_data()
	if Input.is_action_just_pressed("mousebutton") and isHover == true and save_file.headphones == 1 and save_file.goobs >= 500:
		save_file.headphones = 2
		save_file.goobPerClick += 2
		label.get("custom_fonts/font").size = 40
		label.text = "BOUGHT"
		save_file.goobs -= 500
		playBuy.play()
		SaveFile.save_data()
