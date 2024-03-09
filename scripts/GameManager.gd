extends Node

var objects_discovered = {}

func has_object_discover(key:String):
	return objects_discovered.has(key)
	
func _on_hidden_object_object_clicked(object:HiddenObjectData):
	#print("object clicked: "+object.name)
	objects_discovered[object.key] = object
