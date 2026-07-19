extends NinePatchRect

@onready var h_slider_1: HSlider = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/HSlider1
@onready var h_slider_2: HSlider = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer3/HSlider2
@onready var h_slider_3: HSlider = $MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer/HSlider3
@onready var h_slider_4: HSlider = $MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer3/HSlider4
@onready var label_1: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Label1
@onready var label_2: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Label2
@onready var label_3: Label = $MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer/Label3
@onready var label_4: Label = $MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer3/Label4
const SLIDER_BLUE = preload("res://ui-elements/slider_blue.tres")
const SLIDER_GREEN = preload("res://ui-elements/slider_green.tres")
const SLIDER_RED = preload("res://ui-elements/slider_red.tres")
const SLIDER_YELLOW = preload("res://ui-elements/slider_yellow.tres")

var sliders = []
var slider_labels = []

var slider_texture = [
	SLIDER_BLUE,
	SLIDER_GREEN,
	SLIDER_RED,
	SLIDER_YELLOW
]

var slider_label_values = [
		"SIZE: ",
		"SPEED: ",
		"GRAV: ",
		"MASS: ",
	]

func _ready() -> void:
	
	slider_labels = [
		label_1,
		label_2,
		label_3,
		label_4
	]
	sliders = [
		h_slider_1,
		h_slider_2,
		h_slider_3,
		h_slider_4
	]
	
	for slider_index in len(sliders):
		if Global.sliders_activated[slider_index]:
			# deactivated by default, need to turn on if continuing and already on
			var slider: ScaleSlider = sliders[slider_index]
			enable_slider(slider_index+1)
		

func enable_slider(slider_index:int, enabled:=true):
	var slider: ScaleSlider = sliders[slider_index-1] # given 1-4 but index is 0-3
	var label: Label = slider_labels[slider_index-1]
	slider.editable = enabled
	label.text = slider_label_values[slider_index-1]
	slider.add_theme_stylebox_override("grabber_area", slider_texture[slider_index-1])
	slider.add_theme_stylebox_override("grabber_area_highlight", slider_texture[slider_index-1])
	slider.particles()
	$AudioStreamPlayer.play()
	Global.sliders_activated[slider_index-1]=true

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
	Global.mass = value
