extends Control

@export var GameScene : PackedScene
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_stream_player_hover: AudioStreamPlayer = $AudioStreamPlayerHover

func _ready():
	if Global.level == 0:
		pass
	elif Global.level == 1:
		$MarginContainer/HBoxContainer/VBoxContainer2/Level1.disabled = false
	elif Global.level == 2:
		$MarginContainer/HBoxContainer/VBoxContainer2/Level1.disabled = false
		$MarginContainer/HBoxContainer/VBoxContainer2/Level2.disabled = false
	elif Global.level == 3:
		$MarginContainer/HBoxContainer/VBoxContainer2/Level1.disabled = false
		$MarginContainer/HBoxContainer/VBoxContainer2/Level2.disabled = false
		$MarginContainer/HBoxContainer/VBoxContainer2/Level3.disabled = false
	elif Global.level == 4:
		$MarginContainer/HBoxContainer/VBoxContainer2/Level1.disabled = false
		$MarginContainer/HBoxContainer/VBoxContainer2/Level2.disabled = false
		$MarginContainer/HBoxContainer/VBoxContainer2/Level3.disabled = false
		$MarginContainer/HBoxContainer/VBoxContainer2/Level4.disabled = false


func play_game():
	$AudioStreamPlayer.play()
	await $AudioStreamPlayer.finished
	get_tree().change_scene_to_packed(GameScene)

func _on_start_pressed() -> void:
	Global.new_game_reset()
	play_game()

#func _on_start_mouse_entered() -> void:
	#audio_stream_player_hover.play()

func _on_continue_pressed() -> void:
	Global.continue_reset()
	play_game()
	
func _on_level_1_pressed() -> void:
	Global.continue_reset()
	Global.sliders_activated[0]=true
	play_game()

func _on_level_2_pressed() -> void:
	Global.continue_reset()
	Global.sliders_activated[0]=true
	Global.sliders_activated[1]=true
	#Global.spawn = Vector2(6400, 100)
	Global.spawn = Vector2(10496, 0)
	play_game()


func _on_level_3_pressed() -> void:
	Global.continue_reset()
	Global.sliders_activated[0]=true
	Global.sliders_activated[1]=true
	Global.sliders_activated[2]=true
	#Global.spawn = Vector2(113*64, 64)
	Global.spawn = Vector2(16640, 640)
	play_game()


func _on_level_4_pressed() -> void:
	Global.continue_reset()
	Global.sliders_activated[0]=true
	Global.sliders_activated[1]=true
	Global.sliders_activated[2]=true
	Global.sliders_activated[3]=true
	#Global.spawn = Vector2(396*64, 14*64)
	Global.spawn = Vector2(34000, -150)
	play_game()
