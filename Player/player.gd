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
		
		# Simplified movement
		var direction := Input.get_vector("Left", "Right", "Up", "Down")
		if direction:
			velocity = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.y = move_toward(velocity.y, 0, speed)
		move_and_slide()

func check_mask() -> void:
	#TODO This method should change the sprite depending on the mask
	if GameState.current_mask == GameState.Masks.DEFAULT:
		animated_sprite_2d.sprite_frames = load("res://Player/default_sprite_frames.tres")
	
	if GameState.current_mask == GameState.Masks.FOOL:
		animated_sprite_2d.sprite_frames = load("res://Player/starting_sprite_frames.tres")
		
	if GameState.current_mask == GameState.Masks.ARISTROCRAT:
		animated_sprite_2d.sprite_frames = load("res://Player/player_aristo_sprite_frames.tres")
		
	if GameState.current_mask == GameState.Masks.COURTESAN:
		animated_sprite_2d.sprite_frames = load("res://Player/player_courtesan_sprite_frames.tres")
	
	if GameState.current_mask == GameState.Masks.DIPLOMAT:
		animated_sprite_2d.sprite_frames = load("res://Player/player_diplo_sprite_frames.tres")
	
	if GameState.current_mask == GameState.Masks.GUARD:
		animated_sprite_2d.sprite_frames = load("res://Player/player_guard_sprite_frames.tres")

# Change animation depending on button pressed
func change_animation() -> void:
	if velocity.length() > 0:
		animated_sprite_2d.play()
		
		# Player is moving up
		if velocity.y < 0:
			animated_sprite_2d.animation = "walk_up"
		# Walking down
		if velocity.y > 0:
			animated_sprite_2d.animation = "walk_down"
		# Walking left
		if velocity.x < 0:
			animated_sprite_2d.animation = "walk_left"
		# Walking right
		if velocity.x > 0:
			animated_sprite_2d.animation = "walk_right"
		
	# Set idle sprite
	else:
		animated_sprite_2d.stop()
		
		if Input.is_action_just_released("Up"):
			animated_sprite_2d.animation = "idle_up"
		elif Input.is_action_just_released("Down"):
			animated_sprite_2d.animation = "idle_down"
		elif Input.is_action_just_released("Left"):
			animated_sprite_2d.animation = "idle_left"
		elif Input.is_action_just_released("Right"):
			animated_sprite_2d.animation = "idle_right"


func change_sound():
	audio_stream_player_2d.stream = load("res://GGJ_Mask_SFX_Bounce/AristocratTalking-001.wav")
