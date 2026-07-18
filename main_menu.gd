extends Control

@export var GameScene : PackedScene
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_stream_player_hover: AudioStreamPlayer = $AudioStreamPlayerHover

func _on_start_pressed() -> void:
	audio_stream_player.play()
	await $AudioStreamPlayer.finished
	get_tree().change_scene_to_packed(GameScene)

func _on_start_mouse_entered() -> void:
	audio_stream_player_hover.play()
