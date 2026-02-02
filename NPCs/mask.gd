extends Node2D

@export var mask_name = "Default"
var can_pick_up : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Interact") && can_pick_up:
		if mask_name == "Aristocrat":
			GameState.current_mask = GameState.Masks.ARISTROCRAT
		if mask_name == "Courtesan":
			GameState.current_mask = GameState.Masks.COURTESAN
		if mask_name == "Diplomat":
			GameState.current_mask = GameState.Masks.DIPLOMAT
		if mask_name == "Guard":
			GameState.current_mask = GameState.Masks.GUARD
		if mask_name == "Band":
			pass
		if mask_name == "Staff":
			GameState.current_mask = GameState.Masks.STAFF
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	can_pick_up = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	can_pick_up = false
