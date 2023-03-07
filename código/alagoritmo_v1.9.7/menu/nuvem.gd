extends KinematicBody2D

# Armazena o vetor de 2 dimensões com uma velocidade horizontal constante de 10px.
var velocidade = Vector2(10, 0)

func voltaNuvem():
	if $".".position.x > 1200.00:
		$".".move_local_x(-1300) # Retorna a nuvem para a posição inicial.

func _process(_delta):
	global.moveAndSlide = move_and_slide(velocidade)
	voltaNuvem()
