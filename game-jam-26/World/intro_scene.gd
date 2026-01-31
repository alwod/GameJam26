extends Node2D
@onready var black_screen: Sprite2D = $BlackScreen
@onready var victim: Node2D = $Victim


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/intro.dialogue"), "start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameState.intro_lights_out:
		lights_out()
		
	if GameState.intro_lights_on:
		lights_on_again()
		
	if GameState.intro_resume_music:
		resume_music()

func lights_out() -> void:
	black_screen.visible = true
	GameState.intro_lights_out = false
	
func lights_on_again() -> void:
	black_screen.visible = false
	victim.global_rotation_degrees = 90.0
	GameState.intro_lights_on = false
	
func resume_music() -> void:
	GameState.intro_resume_music = false
