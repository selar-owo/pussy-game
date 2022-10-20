extends StaticBody2D

#variables
var isHover = false
var click = preload("res://scenes/ClickParticle.tscn").instance()
var location = position.x

#goobs
var goob1 = preload("res://sprites/goobles/Goob.png")
var goob2 = preload("res://sprites/goobles/Goob2.png")
var goob3 = preload("res://sprites/goobles/Goob3.png")
var goob4 = preload("res://sprites/goobles/Goob4.png")
var goob5 = preload("res://sprites/goobles/Goob5.png")
var goob6 = preload("res://sprites/goobles/Goob6.png")
var goob400 = preload("res://sprites/goobles/Goob400.png")
var goob666 = preload("res://sprites/goobles/Goob666.png")
var goob3007 = preload("res://sprites/goobles/Goob3007.png")

#onready variables
onready var save_file = SaveFile.game_data
onready var charger = get_node("Charger")
onready var tophat = get_node("TopHat")
onready var chargerSupra = get_node("ChargerSuper")
onready var node = get_node(".")
onready var sprite = get_node("Sprite")
onready var headphone = get_node("HeadPhone")
onready var kittyphone = get_node("KittyHeadphone")
onready var anim = get_node("AnimationPlayer")
onready var particle = get_node("Particles2D")
onready var part_timer = get_node("particle")
onready var sombrero = get_node("Sombrero")

#ready function
func _ready():
	DiscordPresence.update_activity()
	#scale fix
	node.scale.x = 3
	node.scale.y = 3
	print(save_file.UpdateChecker1)
	#goob set texture
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
	elif SaveFile.game_data.catType == 666:
		sprite.set_texture(goob666)
	elif SaveFile.game_data.catType == 3007:
		sprite.set_texture(goob3007)

#process function
func _process(delta):
	#get the goob
	if Input.is_action_just_pressed("mousebutton") and isHover == true:
		save_file.goobs += save_file.goobPerClick
		particle.emitting = true
		part_timer.start()
		anim.play("Jumpingfunny")
		if save_file.headphones == 1:
			headphone.frame = 1
			headphone.play()
		if save_file.headphones == 2:
			kittyphone.frame = 1
			kittyphone.play()
		SaveFile.save_data()
	
	#visuals for upgrades
	if save_file.charger == 0:
		charger.hide()
	elif save_file.charger == 1:
		charger.show()
	elif save_file.charger == 2:
		charger.hide()
		chargerSupra.show()
	
	if save_file.tophat == false:
		tophat.hide()
	elif save_file.tophat == true:
		tophat.show()
	
	if save_file.headphones == 0:
		headphone.hide()
	elif save_file.headphones == 1:
		headphone.show()
	elif save_file.headphones == 2:
		headphone.hide()
		kittyphone.show()
	
	if save_file.sombrero == false:
		sombrero.hide()
	elif save_file.sombrero == true:
		sombrero.show()

#isHover
func _on_Area2D_mouse_entered():
	isHover = true
func _on_Area2D_mouse_exited():
	isHover = false

#headphone animation stop
func _on_HeadPhone_animation_finished():
	headphone.stop()

func _on_KittyHeadphone_animation_finished():
	kittyphone.stop()

#particle stop
func _on_particle_timeout():
	part_timer.stop()
	particle.emitting = false
