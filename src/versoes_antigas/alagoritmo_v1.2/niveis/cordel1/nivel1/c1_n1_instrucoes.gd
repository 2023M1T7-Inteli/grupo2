extends Node

# Espaço das instruções que o jogador irá gerar.
onready var instrucao1 = get_node("instrucao_um")

# Organização dessa variável em uma lista
onready var instrucoes = [instrucao1]

# Define a posição das instruções do jogador
onready var posicaoInstrucao = 0

# Tamanho máximo de instruções por nível
onready var tamanhoMaximo = len(instrucoes)

func rodaInstrucaoMatematica(d): # Função geral das operações matemáticas, d -> abreviação de dicionário (colocar aqui qual dicionário de matemática desejar)
	if posicaoInstrucao < tamanhoMaximo:
		instrucoes[posicaoInstrucao].set_text(str(d["valorFigurativo"])) # Determina aonde o valor figurativo da carta aparecerá + o sinal dela
		posicaoInstrucao += 1 # Muda a posição que a próxima instrução irá aparecer (abaixo da última)
		global.valorReal += d["valorFigurativo"] # Muda o valor real das cartas para fins de contas

func apagaInstrucoes():
	posicaoInstrucao = 0 # Volta o indice do array para a 1° posição
	global.valorReal = 0 # Zera o valor para que a próxima conta possa ser feita
	for i in range(len(instrucoes)):
		instrucoes[i].set_text("")

func _on_carta1_pressed():
	rodaInstrucaoMatematica(global.cartaMais4)

func _on_carta2_pressed():
	rodaInstrucaoMatematica(global.cartaMais10)

func _on_botao_lixeira_pressed():
	apagaInstrucoes()
