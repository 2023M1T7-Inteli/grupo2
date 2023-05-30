extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

#global.vidaCangaceiro = 5

var vidaSol = 7

var movimentodireita = 190
var movimentoesquerda = -190

var posicaoDoJogador

var tempoParaPassar

var controleTimer = true # Variável de controle para permitir ou não o uso do timer entre ações.

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
	if global.valorReal == global.resposta:
		atacarAluado()
		vidaSol -= 1
	else:
		#shake.shake(2, 1)
		yield(get_tree().create_timer(0.7), "timeout")
		get_node("mensagens/mensagem_derrota").show()

func verifica_logica():
	#if global.inimigoIf["tipo"] == global.se["tipo"]:
		#pontos +=1
		#print("pode atacar")
	pass

func verifica_looping():
	controleTimer = false
	var itemClonado = global.tipoCartas[1]
	print(itemClonado)
	if itemClonado == "setaD":
		yield(get_tree().create_timer(0.7), "timeout")
		movimento_setas(global.setaD)
	elif itemClonado == "setaE":
		yield(get_tree().create_timer(0.7), "timeout")
		movimento_setas(global.setaE)
	elif itemClonado == "setaC":
		yield(get_tree().create_timer(0.7), "timeout")
		movimento_setas(global.setaC)
	elif itemClonado == "setaB":
		yield(get_tree().create_timer(0.7), "timeout")
		movimento_setas(global.setaB)
	elif itemClonado == "numero":
		yield(get_tree().create_timer(0.7), "timeout")
		verifica_conta()
	elif itemClonado == "se":
		yield(get_tree().create_timer(0.7), "timeout")
		verifica_logica()
	elif itemClonado == "esperar":
		yield(get_tree().create_timer(0.2), "timeout")

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
		elif global.tipoCartas[0] == "looping":
			verifica_looping()
		elif global.tipoCartas[0] == "esperar":
			yield(get_tree().create_timer(0.2), "timeout")
		global.tipoCartas.pop_front()
		if controleTimer == true:
			yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		else:
			pass
	yield(get_tree().create_timer(0.3), "timeout")
	get_node("instrucoes").apagaInstrucoes()
	controleTimer = true

func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	mudarEstagio()
	mostrar_bordas()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagens/mensagem_vitoria").hide()
	get_node("mensagens/mensagem_derrota").hide()
	
	if global.vezQueEntrouNoNivelBoss == 1:
		global.estagio = 6
	elif global.estagioSave == null:
		global.estagio = 6
	else:
		global.estagio = global.estagioSave
	
	global.vidaJogador = 1
	
	get_node("instrucoes").apagaInstrucoes()
	
	global.nivelLume = true

func _process(_delta):
	if global.vidaJogador <= 0:
		get_node("mensagens/mensagem_derrota").show()
	
	if global.vidaCangaceiro <= 0:
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
		#$boss/boss.play("dano")
		yield(get_tree().create_timer(1), "timeout")
		#$boss/boss.play("idle")
		global.levouDano = 0

# Criação dos padrões de cada estágio:

onready var ataqueCurva = preload("res://cenas_universais/hadouken/hadouken_sol.tscn")
onready var ataqueReto = preload("res://cenas_universais/hadouken/hadouken_sol_2.tscn")
onready var preLoadAtaqueAluado = preload("res://cenas_universais/hadouken/hadouken_aluado.tscn")
var ataqueBoss
var ataqueAluado

var numeroAtaques = 0

func mudarEstagio():
	if global.estagio == 6:
		estagio6()
	elif global.estagio == 5:
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

func estagio6():
	tempoParaPassar = 4.75
	while numeroAtaques != 70:
		atacarReto(160, 32, 0)
		atacarReto(104, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 70:
		atacarReto(200, 135, 90)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 70:
		atacarReto(48, 32, 0)
		atacarReto(104, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	global.estagio -= 1

func estagio5():
	tempoParaPassar = 3.75
	global.resposta = 16
	$pergunta.text = "? - 7 = 9"
	numeroAtaques = 0
	while numeroAtaques != 25:
		atacarReto(12, 192, -145)
		atacarReto(72, 192, -145)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	yield(get_tree().create_timer(0.9), "timeout")
	while numeroAtaques != 70:
		atacarReto(160, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	$pergunta.text = ""
	global.estagio -= 1

func estagio4():
	tempoParaPassar = 4.25
	global.resposta = -7
	$pergunta.text = "121 - ? = 114"
	numeroAtaques = 0
	while numeroAtaques != 25:
		atacarReto(192, 192, 165)
		atacarReto(128, 192, 165)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	yield(get_tree().create_timer(0.3), "timeout")
	while numeroAtaques != 70:
		atacarReto(48, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 70:
		atacarReto(200, 135, 90)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	$pergunta.text = ""
	global.estagio -= 1

func estagio3():
	tempoParaPassar = 4
	global.resposta = 12
	$pergunta.text = "6 + 6 = ?"
	while numeroAtaques != 50:
		atacarReto(200, 80, 90)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 50:
		atacarReto(12, 192, -145)
		atacarReto(72, 192, -145)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	$pergunta.text = ""
	global.estagio -= 1

func estagio2():
	tempoParaPassar = 4
	yield(get_tree().create_timer(0.7), "timeout")
	while numeroAtaques != 30:
		atacarReto(160, 32, 0)
		atacarReto(104, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	yield(get_tree().create_timer(1), "timeout")
	while numeroAtaques != 30:
		atacarReto(104, 32, 0)
		atacarReto(48, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout")
		numeroAtaques += 1
	numeroAtaques = 0
	global.estagio -= 1

func estagio1():
	tempoParaPassar = 2
	#global.estagioSave = global.estagio
	global.resposta = 34
	$pergunta.text = "19 + 15 = ?"
	global.estagio -= 1

func atacarCurva(x, y):
	ataqueBoss = ataqueCurva.instance()
	add_child(ataqueBoss)
	ataqueBoss.set_position(Vector2(x, y))

func atacarReto(x, y, r):
	ataqueBoss = ataqueReto.instance()
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
	global.controleMudaCartas = false
	$botoes/botao_olho.modulate = Color(1, 0, 0)
	$botoes/botao_olho.disabled = true
	$jogador.hide()
	$jogador/CollisionShape2D.disabled = true
	mudarEstagio()
	mostrar_bordas()
	global.estagio += 1
	global.valorReal = 0
	$estagio.hide()
	yield(get_tree().create_timer(tempoParaPassar), "timeout")
	$jogador.show()
	$jogador/CollisionShape2D.disabled = false
	$botoes/botao_olho.disabled = false
	$botoes/botao_olho.modulate = Color(0, 1, 0)
	$estagio.show()
	global.controleMudaCartas = true
