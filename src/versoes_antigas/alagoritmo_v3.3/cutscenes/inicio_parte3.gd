extends Node2D

func _ready():
	fala1()
	yield(get_tree().create_timer(3),"timeout")
	fala2()
	yield(get_tree().create_timer(3),"timeout")
	aluado_sai()
	
func fala1():
	$Label.text = "Para sair desse mundo, você precisa do Cristal Celeste!"

func fala2():
	$Label.text = "O outro pedaço está com o cangaceiro. Encontre-o e me traga."

var aluadoAnda = false
func aluado_sai():
	$jogador/Sprite.flip_h = true
	aluadoAnda = true
	fadeout()

func fadeout():
	$fadeout.show()
	var a = 0.0
	while a < 1.0:
		$fadeout.modulate = Color(1,1,1,a)
		a+=0.1
		yield(get_tree().create_timer(0.05),"timeout")
	yield(get_tree().create_timer(1.5),"timeout")
	get_tree().change_scene("res://niveis/cordel1/nivel1/nivel1.tscn")


var estado = 0
func _process(delta):
	if estado == 0:
		$lume.move_and_slide(Vector2(0,-2))
		yield(get_tree().create_timer(1),"timeout")
		estado = 1
	else:
		$lume.move_and_slide(Vector2(0,2))
		yield(get_tree().create_timer(1),"timeout")
		estado = 0
		
	if aluadoAnda:
		$jogador.move_and_slide(Vector2(30,0))
