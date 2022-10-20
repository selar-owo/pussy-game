extends Sprite

onready var sprite = get_node(".")
onready var save_file = SaveFile.game_data
var topHat = preload("res://sprites/fuckaCharge.png")

func _process(delta):
	if save_file.charger == 1 or save_file.charger == 2:
		sprite.set_texture(topHat)
