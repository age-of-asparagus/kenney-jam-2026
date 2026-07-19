extends CharacterBody2D
 
var jump_speed = 200
var size = 1
var speed = 200
var jumpforce = 700
var gravity = 15
var mass = 1

var Ground_Particles = preload("res://walking_particles.tscn")

enum State {
	WALKING,
	JUMPING
}
var state = State.WALKING

func _ready():
	global_position = Global.spawn


func _physics_process(delta):
	
	# Adjust music speed based on Global speed
	$"../AudioStreamPlayer-BackgroundMusic".set_pitch_scale(Global.speed/50.0)
	
	mass = (1/3.0)*3**(Global.mass/50)
	
	gravity = 0.3*(Global.gravity)-15
	
	speed = 62.5*4**(Global.speed/50)
	$AnimatedSprite2D.speed_scale = speed/250
	
	if $detector_objects.has_overlapping_bodies():
		Global.pause_size_increase = true
	else:
		Global.pause_size_increase = false
	
	size = (1/3.0)*3**(Global.size/50)
	scale = Vector2(size,size)
	
	state = State.WALKING
	
	if not is_on_floor():
		state = State.JUMPING
		velocity.x = jump_speed
	else:
		if $detector_jumps.has_overlapping_areas():
			for spring in $detector_jumps.get_overlapping_areas():
				spring.activate()
			velocity.y -= jumpforce * sign(gravity)
			$"AudioStreamPlayer-Jump".play()
		jump_speed = speed
		velocity.x = speed
	
	
	if gravity < 0:
		rotation = deg_to_rad(180)
		$AnimatedSprite2D.flip_h = true
		up_direction.y = 1
	else:
		rotation = deg_to_rad(0)
		$AnimatedSprite2D.flip_h = false
		up_direction.y = -1
	
	velocity.y += gravity
	
	move_and_slide()
	
	match state:
		State.WALKING:
			$AnimatedSprite2D.play("walking")
		State.JUMPING:
			$AnimatedSprite2D.play("jumping")
			
			


func die():

	$"AudioStreamPlayer-Die".play()
	await $"AudioStreamPlayer-Die".finished
	
	Global.size = 50
	Global.speed = 50
	
	get_tree().change_scene_to_file("res://main_menu.tscn")



func _on_detector_obstacles_area_entered(area):
	die()



func _on_animated_sprite_2d_animation_looped():
	print(Global.mass)
	if $AnimatedSprite2D.animation == "walking":
		var ground_particles = Ground_Particles.instantiate()
		ground_particles.global_position = $ground_particle_position.global_position
		ground_particles.scale_amount_min *= mass
		ground_particles.scale_amount_max *= mass
		ground_particles.scale = Vector2(mass,mass)
		ground_particles.emitting = true
		get_parent().add_child(ground_particles)


func _on_detector_checkpoints_area_entered(area):
	Global.spawn = area.global_position + Vector2(0,-20)
	area.activate()
