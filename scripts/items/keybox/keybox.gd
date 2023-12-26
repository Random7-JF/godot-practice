extends Area2D

@onready var KeySpawn = $KeySpawn
@onready var Sprite = $Sprite2D

@export var EmptySprite: Texture2D
@export var ItemsParent: Node2D


var Key = preload("res://scene/items/key.tscn")
var activated = false

func _on_body_entered(body):
	if body.name == "Player" and not activated:
		var key_instance = Key.instantiate()
		ItemsParent.add_child(key_instance)
		key_instance.global_position = KeySpawn.global_position
		Sprite.texture = EmptySprite
		activated = true
