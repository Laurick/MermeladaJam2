extends Node

@onready var background:Texture2D = $TextureRect
@onready var color_rect:ColorRect = $ColorRect

func _ready():
	fade_out()
	Audio.play_music(load("res://music/chiquets.ogg"))
	DialogueManager.passed_title.connect(on_change_title)
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),load("res://dialogs/scene_two.dialogue"),"Intro")

func on_change_title(title:String):
	if title == "dark":
		Audio.play_music(load("res://music/desafecto_colerico.ogg"))
		fade_in()
		color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	elif title == "waiting_desafecto":
		fade_in()
		color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	elif title == "game_over":
		go_to_game_over()
	elif title == "desafecto_bet":
		Audio.play_music(load("res://music/desafecto.ogg"))
		change_location(load("res://images/fondo_bar.jpg"))
	elif title == "mini_game_dice":
		get_tree().change_scene_to_file("res://scenes/mini_game.tscn")
	
func fade_in():
	await get_tree().create_tween().tween_property(color_rect,"color:a",1,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP

func change_location(new_location):
	await fade_in()
	background.texture = new_location
	await fade_out()

func fade_out():
	await get_tree().create_tween().tween_property(color_rect,"color:a",0,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE


func go_to_game_over():
	await fade_in()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
