extends Sprite2D

signal object_clicked(object)

func show_tween(delay: float):
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 0.3)

func set_custom_modulate(color: Color):
	self.self_modulate = color
	
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			var t: CompressedTexture2D = self.texture
			if t.get_image().get_pixel(event.position[0], event.position[1]).a  > 0.1:
				object_clicked.emit(self)
			else:
				var nodes = get_parent().get_children()
				nodes.reverse()
				for n in nodes:
					if n.comsume_unhandled_click():
						break
