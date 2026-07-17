extends CharacterBody2D
 
var speed = 200
var jumpforce = 700
var gravity = 15

enum state {
	RUNNING,
	JUMPING
}

func _ready():
	velocity.x = speed

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= jumpforce
	
	velocity.y += gravity
	
	move_and_slide()
