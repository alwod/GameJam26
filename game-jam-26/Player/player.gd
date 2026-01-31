extends CharacterBody2D

@export var speed : float = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	# Make sure the mask is set to the default one.
	GameState.current_mask = GameState.Masks.FOOL
	animated_sprite_2d.sprite_frames = load("res://Player/default_sprite_frames.tres")

func _process(delta: float) -> void:
	check_mask()

func _physics_process(delta: float) -> void:
	# Don't move the character during dialogue
	if !GameState.is_talking:
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
	if GameState.current_mask == GameState.Masks.DEFAULT:
		animated_sprite_2d.sprite_frames = load("res://Player/default_sprite_frames.tres")
	
	if GameState.current_mask == GameState.Masks.FOOL:
		animated_sprite_2d.sprite_frames = load("res://Player/starting_sprite_frames.tres")

# Change animation depending on button pressed
func change_animation() -> void:
	#TODO could use some polish
	# Player is moving up
	if Input.is_action_just_pressed("Up"):
		animated_sprite_2d.play("walk_up")
	if Input.is_action_just_released("Up"):
		animated_sprite_2d.play("idle_up")
	
	# Player is moving down
	if Input.is_action_just_pressed("Down"):
		animated_sprite_2d.play("walk_down")
	if Input.is_action_just_released("Down"):
		animated_sprite_2d.play("idle_down")
	
	# Player is moving left
	if Input.is_action_just_pressed("Left"):
		animated_sprite_2d.play("walk_left")
	if Input.is_action_just_released("Left"):
		animated_sprite_2d.play("idle_left")
	
	# Player is moving right
	if Input.is_action_just_pressed("Right"):
		animated_sprite_2d.play("walk_right")
	if Input.is_action_just_released("Right"):
		animated_sprite_2d.play("idle_right")


func change_sound():
	audio_stream_player_2d.stream = load("res://GGJ_Mask_SFX_Bounce/AristocratTalking-001.wav")
