extends Label

onready var label = get_node(".")
onready var save_file = SaveFile.game_data

func _process(delta):
	label.text = str(save_file.catType)
