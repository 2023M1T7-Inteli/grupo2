extends Node2D

onready var transicao = get_node("transicao/preenchimento")
onready var animacao = get_node("transicao/preenchimento/animacao")
export(int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertical", "Corte Horizontal") var tipo_transicao
export(float, 2.0) var duracao = 0.8

func _ready():
	$textos.modulate = Color(0,0,0,1)
	
	# O node de transição recebe o tipo e duração declarados nas variáveis
	transicao.material.set_shader_param("type", tipo_transicao)
	animacao.playback_speed = duracao
	# Ao terminar a transição, exclui a colisão para possibilitar clique no restante do HUD
	yield(get_tree().create_timer(duracao),"timeout")
	transicao.queue_free()
	yield(get_tree().create_timer(1.5),"timeout")
	frame1()
	yield(get_tree().create_timer(5),"timeout")
#	frame2()
#	yield(get_tree().create_timer(5),"timeout")
	frame3()
	yield(get_tree().create_timer(5),"timeout")
	frame4()
	yield(get_tree().create_timer(5),"timeout")
	fadeout()
	
func frame1():
	$AnimatedSprite.frame = 6
	$textos.visible_characters = 0
	$textos.text = "Aluado acordou todo assustado,\nno mundo do cordel tinha entrado"
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

#func frame2():
#	$AnimatedSprite.frame = 8
#	$textos.visible_characters = 0
#	$textos.modulate = Color(0,0,0,1)
#	$textos.text = "Tudo em preto e branco, muito diferente\nQue aventura irá enfrentar?"
#	while $textos.visible_characters != len($textos.text):
#		$textos.visible_characters += 1
#		yield(get_tree().create_timer(0.05),"timeout")

func frame3():
	$AnimatedSprite.frame = 9
	$textos.visible_characters = 0
	$textos.modulate = Color(0,0,0,1)
	$textos.text = "Mas logo apareceu bem sorridente\nLume, o Sol, se revelou"
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")
		
func frame4():
	$textos.visible_characters = 0
	$textos.modulate = Color(0,0,0,1)
	$textos.text = "Explicou sobre o mundo em que estava,\nAluado sua jornada iniciou..."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func fadeout():
	$fadeout.show()
	var a = 0.0
	while a < 1.0:
		$fadeout.modulate = Color(1,1,1,a)
		a+=0.1
		yield(get_tree().create_timer(0.05),"timeout")
	yield(get_tree().create_timer(1.5),"timeout")
	get_tree().change_scene("res://cutscenes/inicio_parte3.tscn")
