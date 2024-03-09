extends Node2D

signal music_changed(title)

@onready var audio_stream_player = $AudioStreamPlayer

#put here musics with name and the path
var musics = {
	"Retro Beat": "res://music/test/Retro Beat.ogg",
	"Retro Mystic" : "res://music/test/Retro Mystic.ogg",
	"Retro Polka" : "res://music/test/Retro Polka.ogg"
}

# index of the actual song playing 
var index = 0

# list of songs used in the jukebox, use for get it from dictionary in order
var songs:Array = []

var mouse_inside = false

func _ready():
	songs = musics.keys()
	## load first music
	var next_music = load(musics[songs[index]])
	audio_stream_player.stream = next_music

func play_next():
	index = wrapi(index+1,0,songs.size())
	var song_name = songs[index]
	var next_music = load(musics[song_name])
	stop_jukebox()
	audio_stream_player.stream = next_music
	resume_jukebox()
	music_changed.emit(song_name)


func stop_jukebox():
	audio_stream_player.stop()


func resume_jukebox():
	audio_stream_player.play()


func _on_area_2d_mouse_entered():
	mouse_inside = true


func _on_area_2d_mouse_exited():
	mouse_inside = false


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if mouse_inside and \
		event is InputEventMouseButton and \
		event.button_index == MOUSE_BUTTON_LEFT and \
		event.pressed:
		play_next()
