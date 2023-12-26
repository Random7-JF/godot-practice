extends Area2D

@export var Ladder_Sprite: Texture2D

func _ready():
	$"Ladder-Segment".texture = Ladder_Sprite
	
func _on_body_entered(body):
	if body.name == "Player":
		body.can_climb = true


func _on_body_exited(body):
	if body.name == "Player":
		body.can_climb = false
