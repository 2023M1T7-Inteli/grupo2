extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

var vidaCangaceiro = 5

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

func verifica_conta():
#	vidaCangaceiro -= 1
#	atacarAluado()
	pass

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
	yield(get_tree().create_timer(0.3), "timeout")
	get_node("instrucoes").apagaInstrucoes()
	verifica_vitoria()
	
func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	mostrar_bordas()
	#if pontos == pontosFase:
		#get_node("mensagens/mensagem_vitoria/mensagem").set_text("Parabéns!!! Você conseguiu!")
		#get_node("mensagens/mensagem_vitoria").show()
	#else:
		#get_node("mensagens/mensagem_derrota").show()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
#	get_node("mensagens/mensagem_vitoria").hide()
	pass
 
	if global.posicaoJogador != null:
		$jogador.position = global.posicaoJogador
	
	if global.estagioSave == null:
		global.estagio = 5
	else:
		global.estagio = global.estagioSave
	
	global.vidaJogador = 1
	
	get_node("instrucoes").apagaInstrucoes()

var chegouNaSeta = false

func verifica_vitoria():
	if chegouNaSeta:
		get_node("mensagens/mensagem_vitoria").show()
	else:
		get_node("mensagens/mensagem_derrota").show()


func _process(_delta):
	if $jogador.global_position.x > 235:
		movimentodireita = 0
	else:
		movimentodireita = 190
	if $jogador.global_position.x < 130:
		 movimentoesquerda = 0
	else:
		movimentoesquerda = -190


func _on_piso_direita_body_entered(_body):
	chegouNaSeta = true
