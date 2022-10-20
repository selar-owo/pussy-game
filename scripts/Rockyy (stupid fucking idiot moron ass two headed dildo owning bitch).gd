extends Area2D

onready var save_file = SaveFile.game_data

func _process(delta):
	if Input.is_action_just_pressed("mousebutton"):
		Globals.menuclicks += 1
		print(Globals.menuclicks)
		if Globals.menuclicks >= 666:
			save_file.catType = 666
