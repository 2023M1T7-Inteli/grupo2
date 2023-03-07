extends Node2D

var pontos = 0
var pontosFase
var numeroInstrucoes = 3

func mostrar_bordas():
	for i in range(numeroInstrucoes):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()

func _on_botao_pronto_pressed():
	mudarEstagio()
	mostrar_bordas()

func _ready():
	global.estagioSave = global.estagio

################################################################################

onready var ataque = preload("res://cenas_universais/hadouken/hadouken.tscn")
var ataqueBoss

func mudarEstagio():
	if global.estagio == 5:
		estagio5()
	elif global.estagio == 4:
		estagio4()
	elif global.estagio == 3:
		estagio3()
	elif global.estagio == 2:
		estagio2()
	elif global.estagio == 1:
		estagio1()
	else:
		pass

func estagio5():
	$pergunta.text = "2 + ? = 4"
	atacar(103, 200, 270)
	yield(get_tree().create_timer(0.7), "timeout")
	atacar(200, 135, 180)
	yield(get_tree().create_timer(0.3), "timeout")
	atacar(200, 135, 180)
	yield(get_tree().create_timer(0.3), "timeout")
	atacar(200, 135, 180)

func estagio4():
	atacar(160, 32, 90)
	yield(get_tree().create_timer(0.7), "timeout")
	atacar(104, 32, 90)
	yield(get_tree().create_timer(0.7), "timeout")
	atacar(48, 32, 90)
	yield(get_tree().create_timer(0.7), "timeout")

func estagio3():
	var numeroAtaques = 0
	while numeroAtaques != 28:
		atacar(208, 80, 180)
		yield(get_tree().create_timer(0.05), "timeout")
		numeroAtaques += 1
		if numeroAtaques == 14:
			atacar(160, 32, 90)
			atacar(48, 32, 90)
			yield(get_tree().create_timer(0.7), "timeout")
			atacar(104, 32, 90)
			yield(get_tree().create_timer(0.7), "timeout")

func estagio2():
	$pergunta.text = "12 + ? = 20"
	var numeroAtaques = 0
	while numeroAtaques != 14:
		atacar(200, 135, 180)
		yield(get_tree().create_timer(0.05), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 14:
		atacar(200, 80, 180)
		yield(get_tree().create_timer(0.05), "timeout")
		numeroAtaques += 1

func estagio1():
	$pergunta.text = "16 + 1 = ?"
	atacar(160, 32, 90)
	yield(get_tree().create_timer(0.2), "timeout")
	atacar(160, 32, 90)
	yield(get_tree().create_timer(0.2), "timeout")

func atacar(x, y, r):
	ataqueBoss = ataque.instance()
	add_child(ataqueBoss)
	ataqueBoss.rotation_degrees = r
	ataqueBoss.set_position(Vector2(x, y))

func _on_colisao_cima_body_entered(body):
	if body == ataqueBoss:
		body.queue_free()
