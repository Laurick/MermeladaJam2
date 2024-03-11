@tool
extends Sprite2D

class_name HiddenObject

signal object_clicked(object)

@export var data:HiddenObjectData
@onready var area_2d = $Area2D

var mouse_inside:bool = false

func _ready():
	self.texture = data.image

	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(texture.get_image())
	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))

	for polygon in polygons:
		var collider = CollisionPolygon2D.new()
		collider.polygon = polygon
		area_2d.add_child(collider)


func _on_area_2d_mouse_entered():
	mouse_inside = true


func _on_area_2d_mouse_exited():
	mouse_inside = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if mouse_inside and \
		event is InputEventMouseButton and \
		event.button_index == MOUSE_BUTTON_LEFT and \
		event.pressed:
		object_clicked.emit(data)
		destroy()


func destroy():
	queue_free()

