extends Area2D

@export var level = 0

func activate():
	if level != 0:
		Global.level = level
	$AnimatedSprite2D.play("activated")
