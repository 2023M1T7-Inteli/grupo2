extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

func mostrar_bordas():
	for i in len(global.ordemCartas):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()

func _on_botao_pronto_pressed():
	mudarEstagio()
	mostrar_bordas()

func _ready():
	if global.posicaoJogador != null:
		$jogador.position = global.posicaoJogador
	
	global.estagioSave = global.estagio

func _process(_delta):
	pass

################################################################################

onready var ataque = preload("res://cenas_universais/hadouken/hadouken.tscn")
onready var preLoadAtaqueAluado = preload("res://cenas_universais/hadouken/hadouken_aluado.tscn")
var ataqueBoss
var ataqueAluado

func mudarEstagio():
	if global.estagio == 5:
		estagio5()
	elif global.estagio == 4:
		estagio4()
	else:
		pass

func estagio5():
	atacar(48, 20, 90)
	yield(get_tree().create_timer(0.9), "timeout")
	atacar(104, 20, 90)
	yield(get_tree().create_timer(0.3), "timeout")
	atacar(160, 20, 90)
	global.estagio -= 1

func estagio4():
	$pergunta.text = "1 + 1 = ?"
	atacar(104, 20, 90)
	yield(get_tree().create_timer(0.2), "timeout")
	atacar(104, 20, 90)
	yield(get_tree().create_timer(0.2), "timeout")
	atacar(104, 20, 90)
	yield(get_tree().create_timer(0.2), "timeout")
	global.estagio -= 1

func atacar(x, y, r):
	ataqueBoss = ataque.instance()
	add_child(ataqueBoss)
	ataqueBoss.rotation_degrees = r
	ataqueBoss.set_position(Vector2(x, y))

func atacarAluado():
	global.posicaoJogador = $jogador.get_position()
	ataqueAluado = preLoadAtaqueAluado.instance()
	add_child(ataqueAluado)
	ataqueAluado.position = global.posicaoJogador

func _on_colisao_cima_body_entered(body):
	if body == ataqueBoss:
		body.queue_free()

func _on_botao_olho_pressed():
	global.posicaoJogador = $jogador.get_position()
	print(global.posicaoJogador)
	global.mudaCena = get_tree().change_scene("res://niveis/cordel1/cordel1-nivel3/nivel3.tscn")
	global.valorReal = 0
