extends Control

func _on_main_menu_pressed():
	Audio.play_click_sound()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
