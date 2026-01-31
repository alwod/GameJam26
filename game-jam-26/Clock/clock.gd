extends Node2D

@onready var clock_hand: Sprite2D = $ClockHand
@onready var timer: Timer = $Timer
@export var starting_time : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(starting_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_hand()
	if timer.timeout:
		end_game()

func rotate_hand():
	# First, convert time left into a percentage
	var time_left_percentage = (timer.time_left / starting_time) * 100
	
	# Then, rotate the hand by that percentage ammount
	clock_hand.transform.rotated_local(timer.time_left)

func end_game():
	pass
