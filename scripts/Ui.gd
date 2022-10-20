extends Label
onready var save_file = SaveFile.game_data

onready var gloob = get_node(".")

func _process(delta):
	gloob.text = str(save_file.goobs, " goobs")
