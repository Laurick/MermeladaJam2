extends Control

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/main_options.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/intro.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/main_credits.tscn")
