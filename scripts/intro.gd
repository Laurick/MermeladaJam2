extends Control

var time = 4

@onready var label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	if time < 0:
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	elif time < 1:
		label.text = "intro"
	elif time < 2:
		label.text = "una"
	elif time < 3:
		label.text = "es"
	elif time < 4:
		label.text = "Esto"
