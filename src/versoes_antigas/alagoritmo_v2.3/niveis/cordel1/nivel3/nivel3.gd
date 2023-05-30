extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

#global.vidaCangaceiro = 5

var movimentodireita = 190
var movimentoesquerda = -190

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
#			verifica_conta()
			pass
		elif global.tipoCartas[0] == "se":
			verifica_logica()
		elif global.tipoCartas[0] == "esperar":
			yield(get_tree().create_timer(0.2), "timeout")
		global.tipoCartas.pop_front()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
	yield(get_tree().create_timer(1), "timeout")
	get_node("instrucoes").apagaInstrucoes()
	verifica_vitoria()
	
var chegouNaSeta = false

func verifica_vitoria():
	if chegouNaSeta:
		get_node("mensagens/mensagem_vitoria").show()
	else:
		get_node("mensagens/mensagem_derrota").show()

func _on_piso_direita_body_entered(_body):
	chegouNaSeta = true

func _on_piso_direita_body_exited(_body):
	chegouNaSeta = false

func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	subir_espinhos()
	mostrar_bordas()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagens/mensagem_vitoria").hide()
	get_node("mensagens/mensagem_derrota").hide()
	
	#elif global.posicaoJogador != null:
		#$jogador.position = global.posicaoJogador


	
	get_node("instrucoes").apagaInstrucoes()
var nosEspinhos = false
var clicouNoOlho = false
func _process(_delta):
	if !clicouNoOlho:
		$cartas/carta0.disabled = true
		$cartas/carta1.disabled = true
		$cartas/carta2.disabled = true
		$botoes/botao_pronto.disabled = true
	else:
		$cartas/carta0.disabled = false
		$cartas/carta1.disabled = false
		$cartas/carta2.disabled = false
		$botoes/botao_pronto.disabled = false
		
	if $jogador.global_position.x > 221:
		movimentodireita = 0
	else:
		movimentodireita = 190
	if $jogador.global_position.x < 159:
		 movimentoesquerda = 0
	else:
		movimentoesquerda = -190
	
	if nosEspinhos and $pisos/piso_centro/espinhos.frame > 2:
		yield(get_tree().create_timer(0.2),"timeout")
		get_node("mensagens/mensagem_derrota").show()
	
func subir_espinhos():
	$pisos/piso_centro/espinhos.play("default")
	yield(get_tree().create_timer(0.7), "timeout")
	$pisos/piso_centro/espinhos.play("default", true)

func _on_piso_centro_body_entered(_body):
	nosEspinhos = true

func _on_piso_centro_body_exited(_body):
	nosEspinhos = false

func _on_botao_olho_pressed():
	$mao.hide()
	clicouNoOlho = true
	$botoes/botao_olho.modulate = Color(1, 0, 0)
	$botoes/botao_olho.disabled = true
	subir_espinhos()
	mostrar_bordas()
	$jogador.hide()
	$jogador/CollisionShape2D.disabled = true
	mostrar_bordas()
	yield(get_tree().create_timer(2.1), "timeout")
	$jogador.show()
	$jogador/CollisionShape2D.disabled = false
	$botoes/botao_olho.disabled = false
	$botoes/botao_olho.modulate = Color(0, 1, 0)
