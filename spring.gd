extends Area2D

func activate():
	$AnimatedSprite2D.play("spring out")
	$Timer.start()

func _on_timer_timeout():
	$AnimatedSprite2D.play("spring in")
