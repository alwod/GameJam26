extends Node2D
@onready var black_screen: Sprite2D = $BlackScreen
@onready var victim: Node2D = $Characters/Victim
@onready var player: CharacterBody2D = $Characters/Player

@onready var game_over_1: Sprite2D = $GameOver1
@onready var game_over_2: Sprite2D = $GameOver2
@onready var game_win: Sprite2D = $GameWin
@onready var button: Button = $Button

#var scene = preload("res://World/hacky_intermediate_scene.tscn").instantiate()
const SCENE = preload("res://World/intro_scene.tscn")

const BALOON = preload("res://Dialogue/balloon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.victim_gave_mask = false
	var baloon: Node = BALOON.instantiate()
	get_tree().current_scene.add_child(baloon)
	baloon.start(load("res://Dialogue/intro.dialogue"), "start")
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/intro.dialogue"), "start")
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MUSIC_BACKGROUND)

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
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LIGHTS_OUT)
	black_screen.visible = true
	GameState.intro_lights_out = false
	
func lights_on_again() -> void:
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.VICTIM_DEAD)
	black_screen.visible = false
	victim.global_rotation_degrees = 90.0
	GameState.intro_lights_on = false
	
func resume_music() -> void:
	GameState.intro_resume_music = false
	

func bad_ending_one() -> void:
	black_screen.visible = true
	var baloon: Node = BALOON.instantiate()
	get_tree().current_scene.add_child(baloon)
	baloon.start(load("res://Dialogue/out_of_time.dialogue"), "wrong_accuse")
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/out_of_time.dialogue"), "wrong_accuse")
	GameState.event_bad_accuse = false
	
func bad_ending_two() -> void:
	black_screen.visible = true
	# Out of time dialogue
	var baloon: Node = BALOON.instantiate()
	get_tree().current_scene.add_child(baloon)
	baloon.start(load("res://Dialogue/out_of_time.dialogue"), "start")
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/out_of_time.dialogue"), "start")
	GameState.event_game_over = false
	
func good_ending() -> void:
	black_screen.visible = true
	var baloon: Node = BALOON.instantiate()
	get_tree().current_scene.add_child(baloon)
	baloon.start(load("res://Dialogue/out_of_time.dialogue"), "correct")
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/out_of_time.dialogue"), "correct")
	GameState.event_game_win = false
	
func display_bad_ending_one() -> void:
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MUSIC_OUT_OF_TIME)
	GameState.display_bad_accuse = false
	player.position = Vector2(0, 0)
	button.visible = true
	game_over_1.visible = true
	
func display_bad_ending_two() -> void:
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MUSIC_OUT_OF_TIME)
	GameState.display_game_over = false
	player.position = Vector2(0, 0)
	button.visible = true
	game_over_2.visible = true

func display_good_ending() -> void:
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MUSIC_GAME_WIN)
	GameState.display_game_win = false
	player.position = Vector2(0, 0)
	button.visible = true
	game_win.visible = true

func _on_button_pressed() -> void:
	if (button.visible):
		get_tree().change_scene_to_packed(SCENE)
