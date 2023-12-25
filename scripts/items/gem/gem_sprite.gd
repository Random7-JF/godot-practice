extends Sprite2D
@export var speed = 10
@export var max_height = -10
@export var min_height = 0

var up = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if up:
		position.y = position.y - (speed * delta)
		if position.y <= max_height:
			up = false
	else:
		position.y = position.y + (speed * delta)
		if position.y >= min_height:
			up = true
