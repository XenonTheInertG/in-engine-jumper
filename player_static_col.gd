tool
extends StaticBody2D

#added extra collider cuz collision between player and enemy node (both are kinematic) didn't work

onready var player = get_node("../gaming_area/player_node/")
onready var enemy = get_node("../gaming_area/enemy_node")

func _physics_process(delta):
	global_transform.origin = player.global_transform.origin


func _on_enemy_node_kill_player():
	player.set_visible(false)
	enemy.speed = 0
	#hide()
