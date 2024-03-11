extends Node

@onready var background:TextureRect = $TextureRect
@onready var color_rect:ColorRect = $ColorRect
@onready var letter = $letter

func _ready():
	fade_out()
	Audio.play_music(load("res://music/desafecto.ogg"))
	DialogueManager.passed_title.connect(on_change_title)
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),load("res://dialogs/scene_one.dialogue"),"Intro")


func on_change_title(title:String):
	if title == "bar_one":
		change_location(load("res://images/fondo_bar.jpg"))
	elif title == "bar_two":
		change_location(load("res://images/fondo.jpg"))
	elif title == "show_document":
		show_letter()
	elif title == "hide_document":
		hide_letter()
	elif title == "leave_place":
		change_location(load("res://images/fondo2.jpg"))
	elif title == "game_over":
		go_to_game_over()
	elif title == "mini_game1":
		await fade_in()
		get_tree().change_scene_to_file("res://scenes/mini_game2.tscn")
	elif title == "see_document_again":
		Audio.play_music(load("res://music/desafecto_colerico.ogg"))
	elif title == "next_day":
		change_location(load("res://images/fondo.jpg"))
		Audio.play_music(load("res://music/desafecto.ogg"))
	elif title == "some_here":
		Audio.play_music(load("res://music/chiquets_minijuego.ogg"))


func show_letter():
	get_tree().create_tween().tween_property(letter, "modulate:a", 1.0, 1)


func hide_letter():
	get_tree().create_tween().tween_property(letter, "modulate:a", 0.0, 0.5)


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
