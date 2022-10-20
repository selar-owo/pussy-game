extends Label

onready var save_file = SaveFile.game_data

func _ready():
	get_node(".").text = str(save_file.catType)
