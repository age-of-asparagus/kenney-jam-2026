extends Area2D

@export var level : int

func activate():
	print("hello")
	if level != 0:
		print("hello")
		Global.level = level
	$AnimatedSprite2D.play("activated")
