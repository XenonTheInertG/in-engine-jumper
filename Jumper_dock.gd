tool
extends Control

onready var score_disp = get_node("gaming_area/score_disp")
onready var enemy = get_node("gaming_area/enemy_node")
onready var player = get_node("gaming_area/player_node")
onready var player_static_col = get_node("player_static_col")

var one_sec = 60
var timeout = 1 * one_sec
var time_left = 0
var timer_started : bool = false

func _physics_process(delta):
	
	score_disp.text = str(player.score)
	
	if timer_started == true:
		if time_left < timeout:
			time_left += 1
		else:
			enemy.speed = 250
			timer_started = false
			time_left = 0

func _on_reset_button_pressed():
	enemy.transform.origin = Vector2(25, 162)
	player.set_visible(true)
	player.speed = 250
	player.score = 0
	player.transform.origin = Vector2(128, 162)
	timer_started = true
