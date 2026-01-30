extends CharacterBody2D

@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	#Move player up or down
	var vert_direction := Input.get_axis("Up","Down")
	if vert_direction:
		velocity.y = vert_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Move player left and right
	var horiz_direction := Input.get_axis("Left", "Right")
	if horiz_direction:
		velocity.x = horiz_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
