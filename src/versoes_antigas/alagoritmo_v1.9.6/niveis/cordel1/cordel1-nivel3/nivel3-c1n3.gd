extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

var vidaInimigo = 1

var movimentodireita = 190
var movimentoesquerda = -190

var resposta = 2 # Armazena qual a resposta correta do problema para verificar se a criança acertou.

func mover_direita():
	dash.comeca_dash(sprite, dashDuracao)
	$jogador.velocity = Vector2(movimentodireita,0)
	yield(get_tree().create_timer(0.3), "timeout")
	$jogador.velocity = Vector2(0,0)

func mover_esquerda():
	dash.comeca_dash(sprite, dashDuracao)
	$jogador.velocity = Vector2(movimentoesquerda,0)
	yield(get_tree().create_timer(0.3), "timeout")
	$jogador.velocity = Vector2(0,0)

func mover_baixo():
	dash.comeca_dash(sprite, dashDuracao)
	$jogador.velocity = Vector2(0,165)
	yield(get_tree().create_timer(0.3), "timeout")
	$jogador.velocity = Vector2(0,0)

func mover_cima():
	dash.comeca_dash(sprite, dashDuracao)
	$jogador.velocity = Vector2(0,-170)
	yield(get_tree().create_timer(0.3), "timeout")
	$jogador.velocity = Vector2(0,0)

func movimento_setas(d):
	if d["valor"] == "direita":
		mover_direita()
	elif d["valor"] == "esquerda":
		mover_esquerda()
	elif d["valor"] == "cima":
		mover_cima()
	elif d["valor"] == "baixo":
		mover_baixo()

func mostrar_bordas():
	for i in len(global.ordemCartas):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()

func verifica_conta():
	if global.valorReal == resposta:
		atacarAluado()
		vidaInimigo -= 1
	else:
		shake.shake(2, 1)
		yield(get_tree().create_timer(0.7), "timeout")

func verifica_logica():
	#if global.inimigoIf["tipo"] == global.se["tipo"]:
		#pontos +=1
		#print("pode atacar")
	pass

func ver_qual_funcao_sera_usada():
	while global.tipoCartas != []:
		if global.tipoCartas[0] == "setaD":
			movimento_setas(global.setaD)
		elif global.tipoCartas[0] == "setaE":
			movimento_setas(global.setaE)
		elif global.tipoCartas[0] == "setaC":
			movimento_setas(global.setaC)
		elif global.tipoCartas[0] == "setaB":
			movimento_setas(global.setaB)
		elif global.tipoCartas[0] == "numero":
			verifica_conta()
		elif global.tipoCartas[0] == "se":
			verifica_logica()
		elif global.tipoCartas[0] == "esperar":
			yield(get_tree().create_timer(0.2), "timeout")
		global.tipoCartas.pop_front()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
	#yield(get_tree().create_timer(0.3), "timeout")
	get_node("instrucoes").apagaInstrucoes()

func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	mudarEstagio()
	mostrar_bordas()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagens/mensagem_vitoria").hide()
	
	global.vezQueEntrouNoNivel3 += 1
	
	if global.vezQueEntrouNoNivel3 == 1:
		$jogador.position = Vector2(48, 118)
	elif global.posicaoJogador != null:
		$jogador.position = global.posicaoJogador
	
	if global.estagioSave == null:
		global.estagio = 5
	else:
		global.estagio = global.estagioSave
	
	global.vidaJogador = 1
	
	get_node("instrucoes").apagaInstrucoes()

func _process(_delta):
	if global.vidaJogador <= 0:
		get_node("mensagens/mensagem_derrota").show()
	if vidaInimigo <= 0:
		get_node("mensagens/mensagem_vitoria/mensagem").set_text("Parabéns!!! Você conseguiu!")
		get_node("mensagens/mensagem_vitoria").show()
	
	if $jogador.global_position.x > 160:
		movimentodireita = 0
	else:
		movimentodireita = 190
	if $jogador.global_position.x < 58:
		 movimentoesquerda = 0
	else:
		movimentoesquerda = -190
	
	if global.levouDano == 1:
		global.levouDano = 0
		

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
	global.mudaCena = get_tree().change_scene("res://niveis/cordel1/cordel1-nivel3/padroes/nivel3-padrao.tscn")
	global.valorReal = 0
