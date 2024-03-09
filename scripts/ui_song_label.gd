extends Label

func _on_jukebox_music_changed(title):
	var texto = tr("Now playing: %s") % str(title);
	self.text = texto
	play_tween()


func play_tween():
	var tween = create_tween()
	tween.chain().tween_property(self, "modulate:a", 1.0, 1)
	tween.chain().tween_property(self, "modulate:a", 0.0, 1).set_delay(2)
	tween.play()
