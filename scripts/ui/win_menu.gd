extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scene/level_2.tscn")

func _on_quit_pressed():
	get_tree().quit()
