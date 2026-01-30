extends Area2D

@export var dialogue : DialogueResource
var can_talk : bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("Interact") && can_talk:
		can_talk = false
		DialogueManager.show_example_dialogue_balloon(dialogue, "start")

func _on_body_entered(body: Node2D) -> void:
	can_talk = true
	

func _on_body_exited(body: Node2D) -> void:
	can_talk = false
