extends Button

func _ready():
	mouse_entered.connect(play_sound)

func play_sound():
	Audio.play_ui("switch_sound.ogg", true)
