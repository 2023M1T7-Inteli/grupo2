extends Node

# Espaço das instruções que o jogador irá gerar.
onready var instrucao1 = get_node("instrucao_um")
onready var instrucao2 = get_node("instrucao_dois")

# Organização dessas variáveis em uma lista.
onready var instrucoes = [instrucao1, instrucao2]

# Define a posição das instruções do jogador
onready var posicaoInstrucao = 0

# Tamanho máximo de instruções por nível
onready var tamanhoMaximo = len(instrucoes)

# Função geral das operações matemáticas, d = dicionário (colocar aqui qual dicionário de matemática desejar)
func rodaInstrucaoMatematica(d):
	if posicaoInstrucao < tamanhoMaximo: # Impede que sejam dadas mais instruções do que o tamanho máximo.
		instrucoes[posicaoInstrucao].set_text(str(d["imagem"])) # Determina aonde o valor figurativo da carta aparecerá + o sinal dela
		posicaoInstrucao += 1 # Muda a posição que a próxima instrução irá aparecer (abaixo da última)
		global.valorReal += d["valor"] # Muda o valor real das cartas para fins de contas

func apagaInstrucoes():
	# Valores são zerados para que possam ser reutilizados sem problemas posteriormente.
	posicaoInstrucao = 0 # Volta o indice do array para a 1° posição
	global.valorReal = 0
	global.ordemCartas = []
	global.tipoCartas = []# Zera o valor para que a próxima conta possa ser feita
	for i in range(len(instrucoes)):
		instrucoes[i].set_text("")

func _on_carta1_pressed():
	rodaInstrucaoMatematica(global.cartaMais2)

func _on_carta2_pressed():
	rodaInstrucaoMatematica(global.cartaMais2)

func _on_botao_lixeira_pressed():
	apagaInstrucoes()
