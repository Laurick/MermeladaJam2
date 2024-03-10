extends Control

var index

func _ready():
	index = AudioServer.get_bus_index("Music");
	var tween = get_tree().create_tween()
	tween.tween_method(_set_audio,0.0, 0.5, 1)
	tween.play()
	Audio.play_music(load("res://music/bar_aion.ogg"))

func _set_audio(volume:float):
	print(str(volume))
	AudioServer.set_bus_volume_db(index, linear_to_db(volume))
	
func _on_options_pressed():
	Audio.play_click_sound()
	get_tree().change_scene_to_file("res://scenes/main_options.tscn")

func _on_play_pressed():
	Audio.play_click_sound()
	get_tree().change_scene_to_file("res://scenes/intro.tscn")

func _on_credits_pressed():
	Audio.play_click_sound()
	get_tree().change_scene_to_file("res://scenes/main_credits.tscn")
