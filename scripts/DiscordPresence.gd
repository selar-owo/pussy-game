extends Node
onready var save_file = SaveFile.game_data

func _ready():
	update_activity()

func update_activity() -> void:
	var activity = Discord.Activity.new()
	activity.set_type(Discord.ActivityType.Playing)
	activity.set_state("currently GOOBING")
	activity.set_details("goobsies")
	
	var assets = activity.get_assets()
	assets.set_large_image("discor")
	assets.set_large_text("Pussy Game")
	assets.set_small_image("discor")
	assets.set_small_text("Pussy Game")
	print("discor thing")
	
#	var result = yield(Discord.activity_manager.update_activity(activity), "result")
#	if result
