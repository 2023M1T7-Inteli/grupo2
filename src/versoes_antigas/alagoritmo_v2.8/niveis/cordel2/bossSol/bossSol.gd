extends Node2D

# constante para definir a duração do dash
const dashDuracao = 0.2

# Carregam o sprite do jogador e o node de dash.
onready var sprite = $jogador/Sprite
onready var dash = $Dash

#global.vidaCangaceiro = 5

# Define a vida do sol para que a condição de vitória possa ser feita.
var vidaSol = 7

# Definição do quanto o personagem se movimentará para a direita e esquerda.
var movimentodireita = 190
var movimentoesquerda = -190

var posicaoDoJogador # Registra a posição do jogador.

var tempoParaPassar # Armazena o tempo necessário para passar de cada fase.

var controleTimer = true # Variável de controle para permitir ou não o uso do timer entre ações.

var venceuLume = false

# VARIÁVEIS DE CONTROLE PARA GARANTIR QUE O JOGADOR SEMPRE FAÇA AS CONTAS.
var temConta: bool
var fezConta = false

var controlePerdeu = false

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

# Verifica se a conta do jogador está correta, se true tira a vida do boss, se false mostra a tela de derrota.
func verifica_conta():
	fezConta = true
	if global.valorReal == global.resposta:
		atacarAluado()
		if global.estagio == 0:
			venceuLume = true
	else:
		yield(get_tree().create_timer(1.5), "timeout")
		if venceuLume == false:
			print("Tem alguma coisa rolando")
			#shake.shake(2, 1)
			yield(get_tree().create_timer(1), "timeout")
			get_node("mensagens/mensagem_derrota").show()

var itemClonado

# Verifica qual o tipo da carta seguinte ao looping e repete a função desse tipo.
func verifica_looping():
	controleTimer = false
	if len(global.tipoCartas) > 1:
		itemClonado = global.tipoCartas[1]
	else:
		print("Não há item clonado")
	
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
			verifica_conta()
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

# Funções que são executadas ao pressionar pronto.
func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	mudarEstagio()
	mostrar_bordas()
	yield(get_tree().create_timer(tempoParaPassar), "timeout")
	$pergunta.text = ""

func _ready():
	controlePerdeu = false
	
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagens/mensagem_vitoria").hide()
	get_node("mensagens/mensagem_derrota").hide()
	
	global.vezQueEntrouNoNivelLume += 1
	
	if global.vezQueEntrouNoNivelLume == 1:
		global.estagio = 6
	elif global.estagioSave == null:
		global.estagio = 6
	else:
		global.estagio = global.estagioSave
	
	if global.estagio == 6:
		$jogador.position = Vector2(103, 135)
	elif global.estagio == 5:
		$jogador.position = Vector2(158.59, 83.99)
	elif global.estagio == 4:
		$jogador.position = Vector2(101.59, 133.49)
	elif global.estagio == 3:
		$jogador.position = Vector2(101.59, 82.49)
	elif global.estagio == 2:
		$jogador.position = Vector2(158.59, 131.99)
	elif global.estagio == 1:
		$jogador.position = Vector2(158.59, 131.99)
	
	global.vidaJogador = 1
	
	get_node("instrucoes").apagaInstrucoes()
	
	global.nivelLume = true

func _process(_delta):
	# Condições de vitória
	if global.vidaJogador <= 0 || controlePerdeu == true:
		get_node("mensagens/mensagem_derrota").show()
	
	if venceuLume == true:
		yield(get_tree().create_timer(1.5), "timeout")
		get_node("mensagens/mensagem_vitoria/mensagem").set_text("Parabéns!!! Você conseguiu!")
		get_node("mensagens/mensagem_vitoria").show()
	
	# Limita movimentação mínima e máxima para o personagem não sair dos limites do mapa.
	if $jogador.global_position.x > 160:
		movimentodireita = 0
	else:
		movimentodireita = 190
	if $jogador.global_position.x < 58:
		 movimentoesquerda = 0
	else:
		movimentoesquerda = -190
	
	# Executado ao dar dano no boss.
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

# Ver qual estágio o boss executa
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

# Ataque estágio 6
func estagio6():
	tempoParaPassar = 4.75
	temConta = false
	global.estagioSave = global.estagio
	while numeroAtaques != 70:
		atacarReto(160, 32, 0)
		atacarReto(104, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout") # 0.01
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 70:
		atacarReto(200, 135, 90)
		yield(get_tree().create_timer(0.01), "timeout") # 0.01
		numeroAtaques += 1
	numeroAtaques = 0
	while numeroAtaques != 70:
		atacarReto(48, 32, 0)
		atacarReto(104, 32, 0)
		yield(get_tree().create_timer(0.01), "timeout") # 0.01
		numeroAtaques += 1
	numeroAtaques = 0
	#print("temConta: " + str(temConta))
	#print("fezConta: " + str(fezConta))
	if temConta == fezConta:
		global.estagio -= 1
	else:
		controlePerdeu = true
	fezConta = false

# Ataque estágio 5
func estagio5():
	tempoParaPassar = 3.75
	temConta = true
	global.estagioSave = global.estagio
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
	#$pergunta.text = ""
	print("temConta: " + str(temConta))
	print("fezConta: " + str(fezConta))
	if temConta == fezConta:
		global.estagio -= 1
	else:
		controlePerdeu = true
	fezConta = false

# Ataque estágio 4
func estagio4():
	tempoParaPassar = 4.25
	temConta = true
	global.estagioSave = global.estagio
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
	#$pergunta.text = ""
	if temConta == fezConta:
		global.estagio -= 1
	else:
		controlePerdeu = true
	fezConta = false

# Ataque estágio 3
func estagio3():
	tempoParaPassar = 4
	temConta = true
	global.estagioSave = global.estagio
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
	#$pergunta.text = ""
	if temConta == fezConta:
		global.estagio -= 1
	else:
		controlePerdeu = true
	fezConta = false

# Ataque estágio 2
func estagio2():
	tempoParaPassar = 4
	temConta = false
	global.estagioSave = global.estagio
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
	if temConta == fezConta:
		global.estagio -= 1
	else:
		controlePerdeu = true
	fezConta = false

# Ataque estágio 1
func estagio1():
	tempoParaPassar = 2
	temConta = true
	global.estagioSave = global.estagio
	#global.estagioSave = global.estagio
	global.resposta = 34
	$pergunta.text = "19 + 15 = ?"
	if temConta == fezConta:
		global.estagio -= 1
	else:
		controlePerdeu = true
	fezConta = false

# Função para criar instâncias de ataque do inimigo.
func atacarReto(x, y, r):
	ataqueBoss = ataqueReto.instance()
	add_child(ataqueBoss)
	ataqueBoss.rotation_degrees = r
	ataqueBoss.set_position(Vector2(x, y))

# Função para criar instâncias de ataque do Aluado.
func atacarAluado():
	global.posicaoJogador = $jogador.get_position()
	ataqueAluado = preLoadAtaqueAluado.instance()
	add_child(ataqueAluado)
	ataqueAluado.position = global.posicaoJogador

# Ataques somem ao colidir com o "teto".
func _on_colisao_cima_body_entered(body):
	if body == ataqueBoss:
		body.queue_free()

# Executa os padrões de ataque, desabilita jogador e retorna ao normal.
func _on_botao_olho_pressed():
	$botoes/botao_pronto.disabled = true
	$botoes/botao_lixeira.disabled = true
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
	$botoes/botao_pronto.disabled = false
	$botoes/botao_lixeira.disabled = false
