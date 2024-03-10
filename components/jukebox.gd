extends Node2D

signal music_changed(title)

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
	Audio.play_music(next_music)

func play_next():
	index = wrapi(index+1,0,songs.size())
	var song_name = songs[index]
	var next_music = load(musics[song_name])
	stop_jukebox()
	Audio.play_music(next_music)
	resume_jukebox()
	music_changed.emit(song_name)


func stop_jukebox():
	Audio.stop_music()


func resume_jukebox():
	Audio.resume_music()


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
