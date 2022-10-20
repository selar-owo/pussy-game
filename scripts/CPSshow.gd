extends Label

onready var save_file = SaveFile.game_data
onready var counter = get_node(".")

func _process(delta):
	counter.text = str(save_file.goobPerSecond, " goobs per second")
