extends KinematicBody2D

var velocity = Vector2(0,0)

func _process(_delta):
	global.moveAndSlide = move_and_slide(velocity)
