extends Node2D

@export var button_texture : Texture2D
@export var button_pressed_texture : Texture2D
@export_range(1, 4) var slider : int

signal toggled_on(slider_index)

func _ready() -> void:
	$Switch.texture = button_texture
	$SwitchPressed.texture = button_pressed_texture

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Switch.visible = false
	$SwitchPressed.visible = true
	$AudioStreamPlayer.play()
	emit_signal("toggled_on", self.slider)
	
