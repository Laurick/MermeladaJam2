extends Node

var initial_dice : int
var bet_dice : int

var playing: bool = false

@onready var dice_2 = $Dice2
@onready var dice_1 = $Dice1
@onready var color_rect = $ColorRect

func _ready():
	await fade_out()
	Audio.play_music(load("res://music/dados.ogg"))
	DialogueManager.passed_title.connect(on_change_title)
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),\
	load("res://dialogs/mini_game.dialogue"),"Intro")

func on_change_title(title:String):
	if title == "play":
		start_game()
	elif title == "lower":
		_on_button_bet_lower_pressed()
	elif title == "higher":
		_on_button_bet_higher_pressed()
	elif title == "reset":
		reset()
	elif title == "end_game":
		await fade_in()
		get_tree().change_scene_to_file("res://scenes/intro.tscn")
	
func start_game():
	playing = true
	initial_dice = await throw_dice(dice_1)


func throw_dice(dice:Sprite2D) -> int:
	var dice_throw = 1
	dice.visible = true
	for i in range(20):
		dice_throw = randi() % 6 + 1
		dice.texture = load("res://images/%d.png" % dice_throw)
		await get_tree().process_frame
		await get_tree().process_frame
	return dice_throw


func _on_button_bet_higher_pressed():
	bet_dice = await throw_dice(dice_2)
	if initial_dice < bet_dice:
		win()
	elif initial_dice > bet_dice:
		lose()
	else:
		draw()


func _on_button_bet_lower_pressed():
	bet_dice = await throw_dice(dice_2)
	if initial_dice > bet_dice:
		win()
	elif initial_dice < bet_dice:
		lose()
	else:
		draw()
		
func win():
	Globals.dice = 1

func lose():
	Globals.dice = -1

func draw():
	Globals.dice = 0

func show_result(result_message:String):
	playing = false
	
func reset():
	dice_1.visible = false
	dice_2.visible = false
	playing = false

func fade_in():
	await get_tree().create_tween().tween_property(color_rect,"color:a",1,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP

func fade_out():
	await get_tree().create_tween().tween_property(color_rect,"color:a",0,2).finished
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
