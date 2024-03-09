extends Control

func _ready():
	var tween = create_tween()
	tween.tween_property($ColorRect,"color:a",0,2)
	tween.play()
	
func _unhandled_input(event):
	if event is InputEventKey:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
