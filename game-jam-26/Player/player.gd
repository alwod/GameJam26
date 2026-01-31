extends CharacterBody2D

@export var speed : float = 300.0
var is_talking : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# Make sure the mask is set to the default one.
	GameState.current_mask = GameState.Masks.DEFAULT

func _process(delta: float) -> void:
	if DialogueManager.dialogue_started:
		is_talking = true
	if DialogueManager.dialogue_ended:
		is_talking = false
	check_mask()

func _physics_process(delta: float) -> void:
	# Don't move the character during dialogue
	if is_talking:
		return
	
	change_animation()
	
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

func check_mask() -> void:
	#TODO This method should change the sprite depending on the mask
	pass

# Change animation depending on button pressed
func change_animation() -> void:
	if Input.is_action_just_pressed("Up"):
		animated_sprite_2d.play("walk_up")
	elif Input.is_action_just_pressed("Down"):
		animated_sprite_2d.play("walk_down")
	elif Input.is_action_just_pressed("Left"):
		animated_sprite_2d.play("walk_left")
	elif Input.is_action_just_pressed("Right"):
		animated_sprite_2d.play("walk_right")
	
