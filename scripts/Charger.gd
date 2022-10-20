extends StaticBody2D

#onready variable
onready var label = get_node("LabelCharge")
onready var sprite = get_node("Sprite")
onready var save_file = SaveFile.game_data
onready var playBuy = get_node("buyNoise")

#variable
var completed = preload("res://sprites/chargerSuper.png")
var completedReal = preload("res://sprites/chargerSuperCompleted.png")
var isHover = false

#ready function
func _ready():
	#load savefile
	if save_file.charger == 0:
		label.show()
	elif save_file.charger == 1:
		label.show()
		sprite.set_texture(completed)
		label.text = str("""cost 1000
		it give +10 per second""");
	elif save_file.charger == 2:
		label.get("custom_fonts/font").size = 40
		label.text = "BOUGHT"
		sprite.set_texture(completed)

#isHover
func _on_Area2D_mouse_entered():
	isHover = true
func _on_Area2D_mouse_exited():
	isHover = false

#process function
func _process(delta):
	#buy first upgrade
	if Input.is_action_just_pressed("mousebutton") and isHover == true and save_file.charger == 0 and save_file.goobs >= 300:
		save_file.charger = 1
		save_file.goobPerSecond += 5
		label.text = str("""cost 1000
		it give +10 per second""");
		save_file.goobs -= 300
		sprite.set_texture(completed)
		playBuy.play()
		SaveFile.save_data()
		#buy second upgrade
	elif isHover == true and save_file.charger == 1 and save_file.goobs >= 1000 and Input.is_action_just_pressed("mousebutton"):
		save_file.charger = 2
		save_file.goobPerSecond += 10
		label.get("custom_fonts/font").size = 40
		label.text = "BOUGHT"
		save_file.goobs -= 1000
		playBuy.play()
		SaveFile.save_data()
