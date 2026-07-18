extends Control

@export var GameScene : PackedScene

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(GameScene)
