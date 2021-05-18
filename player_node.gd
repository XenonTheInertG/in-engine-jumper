tool
extends KinematicBody2D

var score : int = 0

var speed : int = 250
var vel : Vector2 = Vector2()

var jump_pressed : bool = false

func _input(event):
	if jump_pressed and is_on_wall():
		jump = true

var jump : bool = false
var jump_limit : int = 0

var one_sec = 60
var time_left = 2 * one_sec
var timer_started : bool = true

func _physics_process(_delta):
	vel = Vector2()
	vel.y += 1

	if timer_started == true:
		if time_left != 0:
			time_left -= 1
		else:
			if is_visible():
				score += 1
			timer_started = false
	else:
		time_left = 1 * one_sec
		timer_started = true
	
	if jump == true:
		if jump_limit < 20:
			jump_limit += 1
			vel.y -= 2
		else:
			jump = false
	else:
		jump_limit = 0
	
	vel = move_and_slide(vel.normalized() * speed)

func _on_jump_button_button_down():
	jump_pressed = true

func _on_jump_button_button_up():
	jump_pressed = false
