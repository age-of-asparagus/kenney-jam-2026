extends CharacterBody2D
 
var size = 1
var speed = 200
var jumpforce = 700
var gravity = 15

var overlapping_object = false

enum State {
	WALKING,
	JUMPING
}
var state = State.WALKING


func _physics_process(delta):
	speed = 62.5*4**(Global.speed/50)
	$AnimatedSprite2D.speed_scale = speed/250
	
	if $detector_objects.has_overlapping_bodies():
		Global.size = Global.previous_size
	size = (1/3.0)*3**(Global.size/50)
	scale = Vector2(size,size)
	
	state = State.WALKING
	
	if not is_on_floor():
		state = State.JUMPING
	
	velocity.x = speed
	velocity.y += gravity
	
	move_and_slide()
	
	match state:
		State.WALKING:
			$AnimatedSprite2D.play("walking")
		State.JUMPING:
			$AnimatedSprite2D.play("jumping")


func die():
	Global.size = 50
	Global.speed = 50
	get_tree().reload_current_scene()


func _on_detector_jumps_area_entered(area):
	velocity.y -= jumpforce


func _on_detector_obstacles_area_entered(area):
	die()
