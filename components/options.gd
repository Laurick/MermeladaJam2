extends Control


func _on_idiomas_item_selected(index):
	match index: 
		0:
			TranslationServer.set_locale("es")
		1:
			TranslationServer.set_locale("en")
		2:
			TranslationServer.set_locale("cat")
		_:
			TranslationServer.set_locale("en")


func _on_music_value_changed(value:float):
	Audio.set_music_value(value)

func _on_sfx_drag_ended(value_changed):
	var value:float = ($MarginContainer/CenterContainer/VBoxContainer/GridContainer/Sfx as Slider).value
	Audio.set_sfx_value(value)
	Audio.play_test_sound()
