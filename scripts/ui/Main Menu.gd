extends Control

var level = "res://scene/level_2.tscn"

func _on_start_button_pressed():
	get_tree().change_scene_to_file(level)

func _on_quit_button_pressed():
	get_tree().quit()

