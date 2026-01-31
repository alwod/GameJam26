extends Node2D

@onready var hand_anchor: Node2D = $HandAnchor
@onready var timer: Timer = $Timer
@export var starting_time : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_hand()
	if GameState.start_game:
		timer.start(starting_time)
		GameState.start_game = false

func rotate_hand():
	# First, convert time left into a percentage
	var time_left_percentage = (timer.time_left / starting_time) * 360
	#print(time_left_percentage)
	
	# Then, rotate the hand by that percentage ammount
	hand_anchor.rotation_degrees = -time_left_percentage

func _on_timer_timeout() -> void:
	print("Game Ended")
	GameState.event_game_over = true
