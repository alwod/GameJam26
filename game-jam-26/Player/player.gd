extends CharacterBody2D

@export var speed : float = 300.0

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	#Move player up or down
	var vert_direction := Input.get_axis("Up","Down")
	if vert_direction:
		velocity.y = vert_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	# Move player left and right
	var horiz_direction := Input.get_axis("Left", "Right")
	if horiz_direction:
		velocity.x = horiz_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
