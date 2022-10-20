extends Label

onready var counter = get_node(".")
onready var save_file = SaveFile.game_data

func _process(delta):
	counter.text = str(save_file.goobPerClick, " goobs per click")
