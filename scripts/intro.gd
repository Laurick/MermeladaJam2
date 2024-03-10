extends Control

@onready var color_rect = $ColorRect

func _ready():
	Audio.stop_music()
	fade_out()
	DialogueManager.dialogue_ended.connect(fade_in.unbind(1))
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),\
	load("res://dialogs/intro.dialogue"),"Intro")


func fade_in():
	await get_tree().create_tween().tween_property(color_rect,"color:a",1,2).finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func fade_out():
	await get_tree().create_tween().tween_property(color_rect,"color:a",0,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
