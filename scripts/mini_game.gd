extends Node

var initial_dice : int
var bet_dice : int

var playing: bool = false

@onready var dice_2 = $Dice2
@onready var dice_1 = $Dice1

func _ready():
	DialogueManager.passed_title.connect(a)
	DialogueManager.show_dialogue_balloon_scene(load("res://components/balloon.tscn"),\
	load("res://dialogs/intro.dialogue"),"Intro")

func a(b):
	if b == "play":
		start_game()
	elif b == "lower":
		_on_button_bet_lower_pressed()
	elif b == "higher":
		_on_button_bet_higher_pressed()
	elif b == "reset":
		reset()
	
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
