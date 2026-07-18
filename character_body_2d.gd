extends CharacterBody2D
 
var speed = 200
var jumpforce = 700
var gravity = 15

enum State {
	WALKING,
	JUMPING
}
var state = State.WALKING


func _physics_process(delta):
	state = State.WALKING
	
	if not is_on_floor():
		state = State.JUMPING
	
	velocity.x = speed
	velocity.y += gravity
	
	move_and_slide()
	
	print(state)
	match state:
		State.WALKING:
			$AnimatedSprite2D.play("walking")
		State.JUMPING:
			$AnimatedSprite2D.play("jumping")


func _on_detector_area_entered(area):
	velocity.y -= jumpforce
