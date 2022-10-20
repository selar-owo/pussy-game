extends Node

const SAVE_FILE = "user://save_file.gloobies" 
var game_data = {}

func _ready():
	load_data()
	update_data()

func save_data():
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()
	print("SAVED ALL DATA")


func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		game_data = {
			"goobs": 0,
			"headphones": 0,
			"goobPerClick": 1,
			"charger": 0,
			"goobPerSecond": 0,
			"tophat": false,
			"catType": 1,
			"bitches": 0,
			"sombrero": false,
			"UpdateChecker1": "Success",
		}
		save_data()
	file.open(SAVE_FILE, File.READ)
	game_data = file.get_var()
	file.close()
	print("LOADED ALL DATA")

func erase_data():
	var dir = Directory.new()
	dir.remove("user://save_file.gloobies" )
#	game_data = {
#		"goobs": 0,
#		"headphones": false,
#		"goobPerClick": 1,
#		"charger": 0,
#		"goobPerSecond": 0,
#		"tophat": false,
#		"catType": 1,
#	}
	print("ERASED ALL DATA")
	get_tree().quit()

func update_data():
	if game_data.UpdateChecker1 == null:
		#the goobies and doobies
		var goobs = game_data.goobs
		var headphones = game_data.headphones
		var goobPerClick = game_data.goobPerClick
		var charger = game_data.charger	
		var goobPerSecond = game_data.goobPerSecond
		var tophat = game_data.tophat
		var catType = game_data.catType
		var bitches = game_data.bitches
		var sombrero = game_data.sombrero
		
		var dir = Directory.new()
		dir.remove("user://save_file.gloobies" )
		game_data = {
			"goobs": goobs,
			"headphones": headphones,
			"goobPerClick": goobPerClick,
			"charger": charger,
			"goobPerSecond": goobPerSecond,
			"tophat": tophat,
			"catType": catType,
			"bitches": bitches,
			"sombrero": sombrero,
			"musicEnabled": true,
			"audioEnabled": true,
			"UpdateChecker1": "Success",
			}
		print("UPDATED ALL DATA")

func force_update_data():
	var goobs = game_data.goobs
	var headphones = game_data.headphones
	var goobPerClick = game_data.goobPerClick
	var charger = game_data.charger	
	var goobPerSecond = game_data.goobPerSecond
	var tophat = game_data.tophat
	var catType = game_data.catType
	var bitches = game_data.bitches
	var sombrero = game_data.sombrero
	var dir = Directory.new()
	dir.remove("user://save_file.gloobies" )
	game_data = {
		"goobs": goobs,
		"headphones": headphones,
		"goobPerClick": goobPerClick,
		"charger": charger,
		"goobPerSecond": goobPerSecond,
		"tophat": tophat,
		"catType": catType,
		"bitches": bitches,
		"sombrero": sombrero,
		"musicEnabled": true,
		"audioEnabled": true,
		"UpdateChecker1": "Success",
		}
	print("FORCED UPDATE ALL DATA, check: ", game_data.UpdateChecker1)
