extends Area2D

@export var speed = 250

func _ready():
	global_position.x = get_parent().get_node("Player").global_position.x - 1000

func _physics_process(delta):
	global_position.x += speed * delta
