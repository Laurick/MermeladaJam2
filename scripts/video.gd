extends Control

var time = 0

func _ready():
	var tween = create_tween()
	tween.tween_property($ColorRect,"color:a",0,2)
	tween.play()

func _process(delta):
	time+=delta

func _input(event):
	if event is InputEventMouseButton and time > 1:
		Audio.play_click_sound()
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func _unhandled_input(event):
	if event is InputEventKey:
		Audio.play_click_sound()
		get_tree().change_scene_to_file("res://scenes/main.tscn")
