extends Node

# Criação de 3 variáveis geradas no começo da cena contendo o espaço das instruções que o jogador irá gerar.
onready var instrucao1 = get_node("instrucao1")
onready var instrucao2 = get_node("instrucao2")
onready var instrucao3 = get_node("instrucao3")

onready var instrucoes = [instrucao1, instrucao2, instrucao3]

# Variável responsável por definir a posição das instruções do jogador
onready var posicaoInstrucao = 0

# Tamanho máximo de instruções por nível
onready var tamanhoMaximo = len(instrucoes)

func roda_instrucao_setas(d):
	if posicaoInstrucao < tamanhoMaximo:
		instrucoes[posicaoInstrucao].set_text(d["imagem"])
		global.guardaImagemInstrucoes.append(d["imagem"])
		global.ordemCartas.append(d["valor"])
		global.tipoCartas.append(d["tipo"])
		posicaoInstrucao += 1
		print(str(global.ordemCartas))

func apagaInstrucoes():
	posicaoInstrucao = 0 # Volta o indice do array para a 1° posição
	global.valorReal = 0 # Zera o valor para que a próxima conta possa ser feita
	for i in range(len(instrucoes)):
		instrucoes[i].set_text("")
		global.ordemCartas = []
		global.tipoCartas = []
		global.guardaImagemInstrucoes = []

func cartas_pressionadas(carta):
	if global.estagio == 5:
		roda_instrucao_setas(global["dic" + str(carta)])
	elif global.estagio == 4:
		roda_instrucao_setas(global["dic" + str(carta)])
	elif global.estagio == 3:
		roda_instrucao_setas(global["dic" + str(carta)])
	elif global.estagio == 2:
		roda_instrucao_setas(global["dic" + str(carta)])
	elif global.estagio == 1:
		roda_instrucao_setas(global["dic" + str(carta)])

func _on_carta1_pressed():
	cartas_pressionadas(1)

func _on_carta2_pressed():
	cartas_pressionadas(2)

func _on_carta3_pressed():
	cartas_pressionadas(3)

func _on_carta4_pressed():
	cartas_pressionadas(4)

func _on_carta5_pressed():
	cartas_pressionadas(5)

func _on_botao_lixeira_pressed():
	apagaInstrucoes()
