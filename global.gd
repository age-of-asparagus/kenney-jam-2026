extends Node

var sliders_activated = [false, false, false, false]
var level = 0

var spawn = Vector2.ZERO

var pause_size_increase = false

var previous_size = 50

var size = 50
var speed = 50
var gravity = 100
var mass = 50

func continue_reset():
	gravity = 100
	size = 50
	speed = 50
	mass = 50
	pause_size_increase = false
	previous_size = 50

func new_game_reset():
	spawn = Vector2.ZERO
	pause_size_increase = false
	previous_size = 50
	size = 50
	speed = 50
	gravity = 100
	mass = 50
	level = 0
	sliders_activated = [false, false, false, false]
