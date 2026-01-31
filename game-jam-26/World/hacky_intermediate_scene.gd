extends Node

var scene = preload("res://World/intro_scene.tscn").instantiate()

func _ready() -> void:
	get_tree().change_scene_to_file("res://World/intro_scene.tscn")
