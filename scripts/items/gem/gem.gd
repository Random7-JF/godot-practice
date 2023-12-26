extends Area2D

@onready var SoundEffect = $AudioStreamPlayer2D
@onready var Sprite = $Sprite
@onready var GemPickupSound: AudioStream = preload("res://assets/sounds/gem_pick_up.mp3")

func _on_body_entered(body):
	if body.name == "Player":
		body.add_gem()
		Sprite.visible = false
		SoundEffect.set_stream(GemPickupSound)
		SoundEffect.set_volume_db(-20.0)
		SoundEffect.set_pitch_scale(2.0)
		SoundEffect.play()
		

func _on_audio_stream_player_2d_finished():
	queue_free() 
