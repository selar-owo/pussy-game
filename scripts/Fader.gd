extends Node2D

signal finished

func _ready():
	if Globals.MainMenu == false:
		show()
		$ColorRect/AnimationPlayer.play("FadeIn")

func fade_out():
	$ColorRect/AnimationPlayer.play_backwards("FadeIn")

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("finished")
	Globals.MainMenu = false


func _on_PlayButton_button_up():
	show()
	fade_out()
