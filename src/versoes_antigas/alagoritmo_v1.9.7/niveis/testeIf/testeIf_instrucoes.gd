extends Node

# Criação de 3 variáveis geradas no começo da cena contendo o espaço das instruções que o jogador irá gerar
onready var instrucao1 = get_node("instrucao_um")
onready var instrucao2 = get_node("instrucao_dois")
onready var instrucao3 = get_node("instrucao_tres")

# Organização dessas 3 variáveis em uma lista
onready var instrucoes = [instrucao1, instrucao2, instrucao3]

# Variável responsável por definir a posição das instruções do jogador
onready var posicaoInstrucao = 0

# Tamanho máximo de instruções por nível
onready var tamanhoMax = len(instrucoes)

func roda_instrucao_setas(d):
	if posicaoInstrucao < tamanhoMax:
		instrucoes[posicaoInstrucao].set_text(d["imagem"])
		global.ordemCartas.append(d["valor"])
		global.tipoCartas.append(d["tipo"])
		posicaoInstrucao += 1

func roda_instrucao_matematica(d):
	if posicaoInstrucao < tamanhoMax:
		instrucoes[posicaoInstrucao].set_text(d["imagem"])
		posicaoInstrucao += 1
		global.ordemCartas.append(d["valor"])
		global.tipoCartas.append(d["tipo"])
		global.valorReal += d["valor"]

func roda_instrucao_se(d):
	if posicaoInstrucao < tamanhoMax:
		instrucoes[posicaoInstrucao].set_text(d["imagem"])
		global.ordemCartas.append(d["valor"])
		global.tipoCartas.append(d["tipo"])
		posicaoInstrucao += 1

func apagaInstrucoes():
	posicaoInstrucao = 0 # Volta o indice do array para a 1° posição
	global.valorReal = 0 # Zera o valor para que a próxima conta possa ser feita
	for i in range(len(instrucoes)):
		instrucoes[i].set_text("")
		global.ordemCartas = []
		global.tipoCartas = []

func _on_carta1_pressed():
	roda_instrucao_setas(global.se)

func _on_carta2_pressed():
	roda_instrucao_se(global.setaD)

func _on_carta3_pressed():
	roda_instrucao_matematica(global.cartaMais1)

func _on_botao_lixeira_pressed():
	apagaInstrucoes()
