extends Control

@onready var color_rect = $ColorRect

func _ready():
	Audio.play_music(load("res://music/radio.ogg"))
	fade_out()
	DialogueManager.dialogue_ended.connect(fade_in.unbind(1))
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),\
	load("res://dialogs/introduction.dialogue"),"Intro")


func fade_in():
	await get_tree().create_tween().tween_property(color_rect,"color:a",1,2).finished
	get_tree().change_scene_to_file("res://scenes/scene_one.tscn")


func fade_out():
	await get_tree().create_tween().tween_property(color_rect,"color:a",0,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
