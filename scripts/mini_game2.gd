extends Control

var child_found = 0

func check_objects():
	if child_found == 4:
		print("YOU WON! :D")


func _on_hidden_object_object_clicked(object):
	child_found += 1
	check_objects()


func _on_hidden_object_2_object_clicked(object):
	child_found += 1
	check_objects()


func _on_hidden_object_3_object_clicked(object):
	child_found += 1
	check_objects()


func _on_hidden_object_4_object_clicked(object):
	child_found += 1
	check_objects()
