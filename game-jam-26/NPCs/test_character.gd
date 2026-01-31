extends Area2D

@export var npc_info : NPCInfo
var can_talk : bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("Interact") && can_talk:
		can_talk = false
		DialogueManager.show_example_dialogue_balloon(npc_info.dialogue, "start")

func _on_body_entered(body: Node2D) -> void:
	can_talk = true
	

func _on_body_exited(body: Node2D) -> void:
	can_talk = false
