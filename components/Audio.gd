extends Node

@onready var audio_stream_player_music:AudioStreamPlayer = $AudioStreamPlayerMusic
@onready var audio_stream_player_ui:AudioStreamPlayer = $AudioStreamPlayerUI

func set_music_value(value:float):
	audio_stream_player_music.volume_db = linear_to_db(value)

func set_sfx_value(value:float):
	audio_stream_player_ui.volume_db = linear_to_db(value)

func play_test_sound():
	audio_stream_player_ui.stream = load("res://music/test/tone1.ogg")
	audio_stream_player_ui.play()

func play_music(music):
	audio_stream_player_music.stream = music
	audio_stream_player_music.play()

func stop_music():
	audio_stream_player_music.stop()

func resume_music():
	audio_stream_player_music.play()
