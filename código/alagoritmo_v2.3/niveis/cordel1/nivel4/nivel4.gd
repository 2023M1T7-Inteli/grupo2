extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

#global.vidaCangaceiro = 5

var movimentodireita = 190
var movimentoesquerda = -190

var posicaoDoJogador

var tempoParaPassar

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
		yield(get_tree().create_timer(2), "timeout")
		get_node("mensagens/mensagem_vitoria").show()
	else:
		#shake.shake(2, 1)
		yield(get_tree().create_timer(0.7), "timeout")
		get_node("mensagens/mensagem_derrota").show()
	

func verifica_logica():
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
	yield(get_tree().create_timer(1), "timeout")
	get_node("instrucoes").apagaInstrucoes()
	
func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	mostrar_bordas()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagens/mensagem_vitoria").hide()
	get_node("mensagens/mensagem_derrota").hide()
	$pergunta.text = "2 + ? = 4"
	global.resposta = 2
	get_node("instrucoes").apagaInstrucoes()
	
func _process(_delta):
	 
	if $jogador.global_position.x > 160:
		movimentodireita = 0
	else:
		movimentodireita = 190
	if $jogador.global_position.x < 58:
		 movimentoesquerda = 0
	else:
		movimentoesquerda = -190
	
	if global.levouDano == 1:
		$boss/boss.play("dano")
		yield(get_tree().create_timer(1), "timeout")
		$boss/boss.play("idle")
		global.levouDano = 0

# Criação dos padrões de cada estágio:

onready var ataque = preload("res://cenas_universais/hadouken/hadouken.tscn")
onready var preLoadAtaqueAluado = preload("res://cenas_universais/hadouken/hadouken_aluado.tscn")
var ataqueBoss
var ataqueAluado


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
	$botoes/botao_olho.modulate = Color(1, 0, 0)
	$botoes/botao_olho.disabled = true
	$jogador.hide()
	$jogador/CollisionShape2D.disabled = true
	mostrar_bordas()
	global.estagio += 1
	global.valorReal = 0
	yield(get_tree().create_timer(tempoParaPassar), "timeout")
	$jogador.show()
	$jogador/CollisionShape2D.disabled = false
	$botoes/botao_olho.disabled = false
	$botoes/botao_olho.modulate = Color(0, 1, 0)
