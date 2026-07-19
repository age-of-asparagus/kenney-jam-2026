extends Area2D


func _on_body_entered(body):
	body.set_physics_process(false)
	body.fade_out()
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
	get_tree().change_scene_to_file("res://win_screen.tscn")
