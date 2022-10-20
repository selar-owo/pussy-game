extends Timer

onready var save_file = SaveFile.game_data

func _on_Timer_timeout():
	save_file.goobs += save_file.goobPerSecond
	SaveFile.save_data()
