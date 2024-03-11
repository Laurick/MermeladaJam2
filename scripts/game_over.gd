extends Control

@onready var color_rect = $ColorRect2

func _ready():
	Audio.play_music(load("res://music/game_over.ogg"))
	fade_out()


func fade_in():
	await get_tree().create_tween().tween_property(color_rect,"color:a",1,1).finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func fade_out():
	await get_tree().create_tween().tween_property(color_rect,"color:a",0,1).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_timer_timeout():
	fade_in()
