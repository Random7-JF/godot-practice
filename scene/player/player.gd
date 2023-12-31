extends CharacterBody2D
@export var SPEED = 250.0
@export var JUMP_VELOCITY = -300.0
#######
var gems = 0
var coins = 0
var health = 10
var keys = 0
#######
var can_climb = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Input.is_action_just_pressed("add_health"):
		add_health()
	if Input.is_action_just_pressed("del_health"):
		del_health()
		
	var climb_direction
	if can_climb:
		climb_direction = Input.get_axis("move_up","move_down")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		$AnimatedSprite2D.play("Walking")

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		$AnimatedSprite2D.play("Jumping")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if climb_direction:
		velocity.y = climb_direction * SPEED
		
	move_and_slide()
	
func add_health(count = 1):
	health += 1
	
func del_health(count = 1):
	health -= 1
	
func add_gem(count = 1):
	gems += count

func kill_oob():
	print("Dead")
	queue_free()
	
func get_health():
	return health

func get_gems():
	return gems

func get_coins():
	return coins

func add_coin(count = 1):
	coins += count

func add_key():
	keys += 1

func get_keys():
	return keys
