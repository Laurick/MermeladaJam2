extends Node

var objects_discovered = {}

@onready var background:Node2D = $Node2D/Background
@onready var color_rect:ColorRect = $UI/ColorRect

func _ready():
	fade_out()
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),load("res://dialogs/test2.dialogue"),"Intro")

func has_object_discover(key:String):
	return objects_discovered.has(key)


func _on_hidden_object_object_clicked(object:HiddenObjectData):
	objects_discovered[object.key] = object

func fade_in():
	await get_tree().create_tween().tween_property(color_rect,"color:a",1,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP


func fade_out():
	await get_tree().create_tween().tween_property(color_rect,"color:a",0,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
