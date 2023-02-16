extends KinematicBody2D

var moveAndSlide # Variável para armazenar o valor da função move_and_slide()
var velocity = Vector2()

func voltaNuvem():
	if $".".position.x > 1200.00:
		$".".move_local_x(-1300)

func _process(delta):
	velocity.x = 20
	moveAndSlide = move_and_slide(velocity)
	voltaNuvem()
