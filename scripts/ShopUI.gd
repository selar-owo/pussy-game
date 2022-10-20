extends Node2D

onready var sneakysnitch = get_node("sneakysnitch")

func _ready():
	sneakysnitch.play()
