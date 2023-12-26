extends Node2D

@export var keys_required = 2
@export var canvas: CanvasLayer
var win_menu = preload("res://scene/UI/win_menu.tscn")


func _on_door_trigger_body_entered(body):
	if body.name == "Player":
		if body.keys == keys_required:
			var instance = win_menu.instantiate()
			canvas.add_child(instance)
