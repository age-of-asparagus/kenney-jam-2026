extends CharacterBody2D
 
var size = 1
var speed = 200
var jumpforce = 700
var gravity = 15

enum State {
	WALKING,
	JUMPING
}
var state = State.WALKING


func _physics_process(delta):
	size = 0.25*4**(Global.size/50)
	print(Global.size)
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


func _on_detector_area_entered(area):
	velocity.y -= jumpforce
