extends StaticBody2D

@export var durability = 100

func broken():
	queue_free()
