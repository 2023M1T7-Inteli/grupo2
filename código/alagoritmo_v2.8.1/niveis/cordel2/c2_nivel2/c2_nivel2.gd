extends Node2D

# constante para definir a duração do dash
const dashDuracao = 0.2

# Carregam o sprite do jogador e o node de dash.
onready var sprite = $jogador/Sprite
onready var dash = $Dash

# Definição do quanto o personagem se movimentará para a direita e esquerda.
var movimentodireita = 190
var movimentoesquerda = -190

var controleTimer = true # Variável de controle para permitir ou não o uso do timer entre ações.

# Funções que definem a movimentação para direita/esquerda/baixo/cima.
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

# Identifica qual tipo de instrução e executa a movimentação dependendo disso.
func movimento_setas(d):
	if d["valor"] == "direita":
		mover_direita()
	elif d["valor"] == "esquerda":
		mover_esquerda()
	elif d["valor"] == "cima":
		mover_cima()
	elif d["valor"] == "baixo":
		mover_baixo()

# Mostra a borda da instrução que está executando no momento.
func mostrar_bordas():
	for i in len(global.ordemCartas):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()

var itemClonado

# Verifica qual o tipo da carta seguinte ao looping e repete a função desse tipo.
func verifica_looping():
	controleTimer = false
	if len(global.tipoCartas) > 1:
		itemClonado = global.tipoCartas[1]
	else:
		print("Não há item clonado")
	
	if itemClonado == "setaD":
		#yield(get_tree().create_timer(0.7), "timeout")
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
	elif itemClonado == "esperar":
		yield(get_tree().create_timer(0.2), "timeout")

# Verifica qual função será usada dependendo do tipo de carta do array.
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
			pass
		elif global.tipoCartas[0] == "looping":
			verifica_looping()
		elif global.tipoCartas[0] == "esperar":
			yield(get_tree().create_timer(0.2), "timeout")
		global.tipoCartas.pop_front()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
	yield(get_tree().create_timer(0.3), "timeout")
	get_node("instrucoes").apagaInstrucoes()
	verifica_vitoria()

#Máquina de estado que verifica se o jogador chegou no piso à direita
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

#Funções que são executadas ao pressionar pronto
func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	mostrar_bordas()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagens/mensagem_vitoria").hide()
	get_node("mensagens/mensagem_derrota").hide()
	
	#elif global.posicaoJogador != null:
		#$jogador.position = global.posicaoJogador
	
	get_node("instrucoes").apagaInstrucoes()

func _process(_delta):
	# Limita movimentação mínima e máxima para o personagem não sair dos limites do mapa
	if $jogador.global_position.x > 288:
		movimentodireita = 0
	else:
		movimentodireita = 190
	if $jogador.global_position.x < 159:
		 movimentoesquerda = 0
	else:
		movimentoesquerda = -190

func _on_colisao_cima_body_entered(_body):
	pass
