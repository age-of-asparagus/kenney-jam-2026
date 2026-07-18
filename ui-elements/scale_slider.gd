extends HSlider

# The game should use this instead of value_changed to get the smoothed value
signal tweened_value_changed(new_value: float)

@export var tween_speed_seconds: float = 0.5
var internal_value: float
var tween: Tween
var is_dragging_grabber: bool = false

func _ready() -> void:
	internal_value = value

func _on_value_changed(new_value: float) -> void:

	var target_value = new_value
	# how far the slider needs to travel
	var distance: float = abs(target_value - internal_value)
	# tween_speed_seconds is for the whole distance.
	var duration: float = (distance / self.max_value) * tween_speed_seconds
	set_value_no_signal(internal_value) # put the grabber back
	
	#Kill old tween
	if tween and tween.is_running():
		tween.kill()
		
	tween = create_tween()
	
	# Tween it from the old position to the  target.
	tween.tween_method(_tween_slider_value, internal_value, target_value, duration) \
		.set_trans(Tween.TRANS_SINE) 
		#.set_ease(Tween.)

# The tween calls this function on every frame of the animation
func _tween_slider_value(val: float) -> void:
	internal_value = val
	set_value_no_signal(val)
	tweened_value_changed.emit(val)


#func _on_tweened_value_changed(new_value: float) -> void:
	#print("Tweened value: ", new_value)
