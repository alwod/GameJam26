extends Area2D

@export var dialogue : DialogueResource
var can_talk : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_talk = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Interact") && can_talk:
		DialogueManager.show_example_dialogue_balloon(dialogue, "start")

func _on_body_entered(body: Node2D) -> void:
	can_talk = true
	

func _on_body_exited(body: Node2D) -> void:
	can_talk = false
