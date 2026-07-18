extends Control
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_h_slider_1_value_changed(value: float) -> void:
	#audio_stream_player.play()
	Global.size = value

func _on_h_slider_2_value_changed(value: float) -> void:
	#audio_stream_player.play()
	Global.speed = value

func _on_h_slider_3_value_changed(value: float) -> void:
	#audio_stream_player.play()
	Global.gravity = value

func _on_h_slider_4_value_changed(value: float) -> void:
	#audio_stream_player.play()
	Global.jump = value
