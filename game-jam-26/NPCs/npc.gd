extends Node2D

var can_talk : bool = false

@export var npc_name : String
@export var portrait : Texture2D
@export var sprite : SpriteFrames

@export var dialogue : DialogueResource

@export var is_evil : bool = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	if Input.is_action_pressed("Interact") && can_talk:
		can_talk = false
		DialogueManager.show_example_dialogue_balloon(dialogue, "start")
		
	if npc_name == "Victim" && GameState.victim_gave_mask:
		animated_sprite_2d.sprite_frames = load("res://NPCs/Victim/victim2_sprite_frames.tres")

func _on_body_entered(body: Node2D) -> void:
	can_talk = true
	

func _on_body_exited(body: Node2D) -> void:
	can_talk = false
