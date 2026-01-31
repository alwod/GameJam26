extends Node2D
@onready var black_screen: Sprite2D = $BlackScreen
@onready var victim: Node2D = $Characters/Victim
@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Start playing intro music
	
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/intro.dialogue"), "start")

# Called every frame. 'delta' is the elapsed time since the previous frasme.
func _process(delta: float) -> void:
	# Pain
	if GameState.intro_lights_out:
		lights_out()
		
	if GameState.intro_lights_on:
		lights_on_again()
		
	if GameState.intro_resume_music:
		resume_music()
		
	if GameState.event_bad_accuse:
		bad_ending_one()
		
	if GameState.event_game_over:
		bad_ending_two()
		
	if GameState.event_game_win:
		good_ending()
		
	if GameState.display_bad_accuse:
		display_bad_ending_one()
	
	if GameState.display_game_over:
		display_bad_ending_two()
		
	if GameState.display_game_win:
		display_good_ending()

func lights_out() -> void:
	# Pause music
	audio_stream.stream = load("res://GGJ_Mask_SFX_Bounce/LightsOff.wav")
	audio_stream.play()
	black_screen.visible = true
	GameState.intro_lights_out = false
	
func lights_on_again() -> void:
	audio_stream.stream = load("res://GGJ_Mask_Music/Music_VictimKilled.wav")
	audio_stream.play()
	black_screen.visible = false
	victim.global_rotation_degrees = 90.0
	GameState.intro_lights_on = false
	
func resume_music() -> void:
	# Start Game Music
	GameState.intro_resume_music = false
	
# Accuse the wrong person
func bad_ending_one() -> void:
	black_screen.visible = true
	audio_stream.stream = load("res://GGJ_Mask_SFX_Bounce/LightsOff.wav")
	audio_stream.play()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/out_of_time.dialogue"), "wrong_accuse")
	GameState.event_bad_accuse = false

# Run out of time
func bad_ending_two() -> void:
	black_screen.visible = true
	audio_stream.stream = load("res://GGJ_Mask_SFX_Bounce/LightsOff.wav")
	audio_stream.play()
	# Out of time dialogue
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/out_of_time.dialogue"), "start")
	GameState.event_game_over = false

# Good ending
func good_ending() -> void:
	black_screen.visible = true
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/out_of_time.dialogue"), "correct")
	GameState.event_game_win = false
	
func display_bad_ending_one() -> void:
	GameState.display_bad_accuse = false
	
func display_bad_ending_two() -> void:
	GameState.display_game_over = false
	print("Reached the final end")

func display_good_ending() -> void:
	GameState.display_game_win = false
