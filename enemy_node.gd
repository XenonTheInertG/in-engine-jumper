tool
extends KinematicBody2D

var speed : int = 125
var vel : Vector2 = Vector2()

var dir : String = "left"

signal kill_player


func _physics_process(_delta):
	vel = Vector2()
	
	vel.y += 1
	
	if dir == "right":
		vel.x += 1
	elif dir == "left":
		vel.x -= 1
		
	for i in get_slide_count():
		var col = get_slide_collision(i)
		if col.collider.name == "wall0":
			dir = "right"
		elif col.collider.name == "wall256":
			dir = "left"
			
		if col.collider.name == "player_static_col":
			emit_signal("kill_player")
	
	vel = move_and_slide(vel.normalized() * speed)

