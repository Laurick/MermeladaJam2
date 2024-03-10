extends Node

var initial_dice : int
var bet_dice : int

var playing: bool = false

@onready var dice_2 = $Dice2
@onready var dice_1 = $Dice1
@onready var result = $VBoxContainer/Result
@onready var v_box_container = $VBoxContainer/VBoxContainer
@onready var start_label = $VBoxContainer/StartLabel


func _unhandled_input(event):
	if !playing and event is InputEventKey and (event as InputEventKey).is_action_released("ui_accept"):
		reset()
		start_game()


func start_game():
	playing = true
	result.visible = false
	start_label.visible = false
	initial_dice = await throw_dice(dice_1)
	v_box_container.visible = true


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
	v_box_container.visible = false
	bet_dice = await throw_dice(dice_2)
	if initial_dice < bet_dice:
		win()
	elif initial_dice > bet_dice:
		lose()
	else:
		draw()


func _on_button_bet_lower_pressed():
	v_box_container.visible = false
	bet_dice = await throw_dice(dice_2)
	if initial_dice > bet_dice:
		win()
	elif initial_dice < bet_dice:
		lose()
	else:
		draw()
		
func win():
	show_result("YOU WON! :D")

func lose():
	show_result("YOU LOSE! :(")

func draw():
	show_result("DRAW, PRESS SPACE AGAIN")

func show_result(result_message:String):
	result.visible = true
	result.text = result_message
	playing = false
	
func reset():
	dice_1.visible = false
	dice_2.visible = false
	playing = false
