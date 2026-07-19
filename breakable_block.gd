extends StaticBody2D

@export var durability = 100

func broken():
	$AudioStreamPlayer.play()
	visible = false
	await $AudioStreamPlayer.finished
	queue_free()
