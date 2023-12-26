extends Area2D

@onready var Sprite = $Coin
@onready var SoundEffect = $AudioStreamPlayer2D
@onready var CoinPickupSound: AudioStream = preload("res://assets/sounds/coin_pick_up.mp3")
var picked_up: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player" and not picked_up:
		body.add_coin()
		play_sound()
		Sprite.visible = false
		picked_up = true

func play_sound():
	SoundEffect.set_stream(CoinPickupSound)
	SoundEffect.set_volume_db(-15.0)
	SoundEffect.set_pitch_scale(2.0)
	SoundEffect.play()


func _on_audio_stream_player_2d_finished():
	queue_free()
