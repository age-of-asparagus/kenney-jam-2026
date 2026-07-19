extends Control

@export var GameScene : PackedScene
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_stream_player_hover: AudioStreamPlayer = $AudioStreamPlayerHover

func play_click():
	audio_stream_player.play()
	await $AudioStreamPlayer.finished
	
func play_game():
	play_click()
	get_tree().change_scene_to_packed(GameScene)

func _on_start_pressed() -> void:
	Global.reset()
	play_game()

func _on_start_mouse_entered() -> void:
	audio_stream_player_hover.play()

func _on_continue_pressed() -> void:
	play_game()

func _on_level_2_pressed() -> void:
	Global.reset()
	Global.sliders_activated[0]=true
	Global.spawn = Vector2(6400, 100)
	play_game()


func _on_level_3_pressed() -> void:
	Global.reset()
	Global.sliders_activated[0]=true
	Global.sliders_activated[1]=true
	#Global.spawn = Vector2(113*64, 64)
	Global.spawn = Vector2(16640, 640)
	play_game()


func _on_level_4_pressed() -> void:
	Global.reset()
	Global.sliders_activated[1]=true
	Global.sliders_activated[2]=true
	Global.sliders_activated[1]=true
	play_game()
