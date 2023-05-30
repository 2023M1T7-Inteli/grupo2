extends KinematicBody2D

var velocity = Vector2(-400, 0)

func _physics_process(_delta):
	global.moveAndSlide = move_and_slide(velocity)

