extends Node2D


const SCENE = preload("res://World/intro_scene.tscn")

func _ready() -> void:
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MUSIC_START_SCREEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	AudioManager.stop_all_audio()
	get_tree().change_scene_to_packed(SCENE)
