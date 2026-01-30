class_name npc
extends Resource

@export var name : String
@export var portrait : Texture2D
@export var sprite : SpriteFrames

@export var dialogue : DialogueResource

func _init() -> void:
	name = "No Name"
	portrait = load("res://icon.svg")
	sprite = null
	dialogue = load("res://Dialogue/test_dialogue.dialogue")
