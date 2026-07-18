extends NinePatchRect

@onready var h_slider_1: HSlider = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/HSlider1
@onready var h_slider_2: HSlider = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer3/HSlider2
@onready var h_slider_3: HSlider = $MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer/HSlider3
@onready var h_slider_4: HSlider = $MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer3/HSlider4
var sliders = []

func _ready() -> void:
	sliders = [
		h_slider_1,
		h_slider_2,
		h_slider_3,
		h_slider_4
	]

func enable_slider(slider_index:int, enabled:=true):
	var slider: HSlider = sliders[slider_index]
	slider.editable = enabled
			

func _on_h_slider_1_value_changed(value: float) -> void:
	#audio_stream_player.play()
	
	#print("Slider tweened: ", value)
	#print("Size: ", Global.size)
	Global.previous_size = Global.size
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
