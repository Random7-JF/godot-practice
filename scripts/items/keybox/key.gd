extends Area2D

@onready var sprite = $Sprite2D
@onready var SoundEffect = $AudioStreamPlayer2D
@onready var KeyPickupSound: AudioStream = preload("res://assets/sounds/key_pick_up.mp3")

var grav = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var speed: int = 10

var activated = false
var falling = true

func _process(delta):
	if falling:
		position.y += lerp(0, speed, speed * delta)

func _on_body_entered(body):
	if body.name == "Player" and not activated:
		print("Key found!")
		body.add_key()
		activated = true
		sprite.visible = false
	elif body.name == "World-TileMap":
		falling = false

func _on_audio_stream_player_2d_finished():
	queue_free()

func play_sound():
	SoundEffect.set_stream(KeyPickupSound)
	SoundEffect.set_volume_db(-15.0)
	SoundEffect.set_pitch_scale(2.0)
	SoundEffect.play()
