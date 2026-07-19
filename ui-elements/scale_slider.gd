class_name ScaleSlider extends HSlider

# The game should use this instead of value_changed to get the smoothed value
signal tweened_value_changed(new_value: float)

@export var tween_speed_seconds: float = 0.5
var internal_value: float # where the slider should be
var tween: Tween
var is_dragging_grabber: bool = false

func _on_resized():
	pivot_offset = size / 2.0

func particles():
	$CPUParticles2D.emitting=true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.1) \
		.set_trans(Tween.TRANS_QUAD) \
		.set_ease(Tween.EASE_OUT)
		
	# Phase 2: Snap back down with a bouncy overshoot
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.3) \
		.set_trans(Tween.TRANS_BACK) \
		.set_ease(Tween.EASE_OUT)

func _ready() -> void:
	internal_value = value
	
	# Need to change pivot for pulse to look good from center
	# Set the pivot to the exact center of the node
	pivot_offset = size / 2.0
	
	# Optional but recommended: If your slider might change size 
	# (e.g., window resize), update the pivot whenever it resizes.
	resized.connect(_on_resized)

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
		.set_trans(Tween.TRANS_LINEAR) 
		#.set_ease(Tween.)

# The tween calls this function on every frame of the animation
func _tween_slider_value(val: float) -> void:
	# if the character shouldn't grow (e.g. would hit a roof)
	# and if user is trying to grow, prevent it 
	#print("Paused?: ", Global.pause_size_increase)
	#print("Growing: ", val > internal_value)
	if Global.pause_size_increase and val > internal_value:
		return
	internal_value = val
	set_value_no_signal(val)
	tweened_value_changed.emit(val)


#func _on_tweened_value_changed(new_value: float) -> void:
	#print("Tweened value: ", new_value)


func _on_focus_entered() -> void:
	$AudioStreamPlayer.play()
