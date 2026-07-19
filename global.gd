extends Node

var size_activated = false
var speed_activated = false
var gravity_activated = false
var mass_activated = false


var spawn = Vector2.ZERO

var pause_size_increase = false

var previous_size = 50

var size = 50
var speed = 50
var gravity = 100
var mass = 50

func reset():
	spawn = Vector2.ZERO
	pause_size_increase = false
	previous_size = 50
	size = 50
	speed = 50
	gravity = 100
	mass = 50
	size_activated = false
	speed_activated = false
	gravity_activated = false
	mass_activated = false
