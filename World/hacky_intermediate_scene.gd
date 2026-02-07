extends Node

const SCENE = preload("res://World/intro_scene.tscn")

func _ready() -> void:
	get_tree().change_scene_to_packed(SCENE)
