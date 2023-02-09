extends Node

# Criação de 3 variáveis geradas no começo da cena contendo o espaço das instruções que o jogador irá gerar
onready var instrucao1 = get_node("instrucao_um")
onready var instrucao2 = get_node("instrucao_dois")
onready var instrucao3 = get_node("instrucao_tres")

# Organização dessas 3 variáveis em uma lista
onready var instrucoes = [instrucao1, instrucao2, instrucao3]

# Variável responsável por definir a posição das instruções do jogador
onready var posicaoInstrucao = 0

func roda_instrucao_carta_mais_dois(): # Define o que acontece quando as cartas forem selecionadas
	instrucoes[posicaoInstrucao].set_text(str("+", global.valorCartaMaisDoisFigurativo)) # Determina aonde o valor figurativo da carta aparecerá
	posicaoInstrucao += 1 # Muda a posição que a próxima instrução irá aparecer (abaixo da última)
	global.valorCartaMaisDoisReal += 2 # Muda o valor real das cartas para fins de contas

func _on_carta_mais_dois_pressed():
	roda_instrucao_carta_mais_dois()

func _on_carta_mais_dois2_pressed():
	roda_instrucao_carta_mais_dois()

func _on_carta_mais_dois3_pressed():
	roda_instrucao_carta_mais_dois()
