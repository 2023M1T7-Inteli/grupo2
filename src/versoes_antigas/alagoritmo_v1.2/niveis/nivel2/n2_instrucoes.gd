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
onready var tamanhoMaximo = 3

func roda_instrucao_setas(d):
	if posicaoInstrucao < tamanhoMaximo:
		instrucoes[posicaoInstrucao].set_text(d["imagem"])
		global.ordemCartas.append(d["valor"])
		posicaoInstrucao += 1
		print(str(global.ordemCartas))

func apagaInstrucoes():
	posicaoInstrucao = 0 # Volta o indice do array para a 1° posição
	global.valorReal = 0 # Zera o valor para que a próxima conta possa ser feita
	for i in range(len(instrucoes)):
		instrucoes[i].set_text("")
		global.ordemCartas = []

func _on_carta1_pressed():
	roda_instrucao_setas(global.setaD)

func _on_carta2_pressed():
	roda_instrucao_setas(global.setaE)

func _on_carta3_pressed():
	roda_instrucao_setas(global.setaD)

func _on_botao_lixeira_pressed():
	apagaInstrucoes()
