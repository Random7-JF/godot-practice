extends CharacterBody2D

@export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Player Loaded")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_intput()
	move_and_slide()
	
func get_intput():
	var input_vector = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_vector * speed
