extends Node

# Criação de 3 variáveis geradas no começo da cena contendo o espaço das instruções que o jogador irá gerar.
onready var instrucao1 = get_node("instrucao1")
onready var instrucao2 = get_node("instrucao2")
onready var instrucao3 = get_node("instrucao3")

onready var instrucoes = [instrucao1, instrucao2, instrucao3]

# Variável responsável por definir a posição das instruções do jogador
onready var posicaoInstrucao = 0

# Tamanho máximo de instruções por nível
onready var tamanhoMaximo = 2

var guardaValor = 0 # Variável pra guardar o valor momentâneamente das contas e, ao final, jogar para o valorReal.

func roda_instrucao_setas(d):
	if posicaoInstrucao < tamanhoMaximo:
		instrucoes[posicaoInstrucao].set_text(d["imagem"])
		global.guardaImagemInstrucoes.append(d["imagem"])
		global.ordemCartas.append(d["valor"])
		global.tipoCartas.append(d["tipo"])
		posicaoInstrucao += 1
		if d["tipo"] == "numero":
			guardaValor += d["valor"]
			print(guardaValor)
			if posicaoInstrucao == tamanhoMaximo:
				global.valorReal = guardaValor
				print(global.valorReal)

func apagaInstrucoes():
	posicaoInstrucao = 0 # Volta o indice do array para a 1° posição.
	global.valorReal = 0 # Zera o valor para que a próxima conta possa ser feita.
	guardaValor = 0 # Zera o valor para que novas contas possam ser feitas.
	for i in range(len(instrucoes)):
		instrucoes[i].set_text("") # Reseta a string das labels.
		# Reseta todos os arrays que são usados em contas durante a fase.
		global.ordemCartas = [] 
		global.tipoCartas = []
		global.guardaImagemInstrucoes = []

# Quando as cartas são pressionadas a função roda_instrucao_setas é chamada de acordo com o índice das cartas.
func cartas_pressionadas(carta):
	roda_instrucao_setas(global["dic" + str(carta)])

func _on_carta0_pressed():
	cartas_pressionadas(0)
	
func _on_carta1_pressed():
	cartas_pressionadas(1)

func _on_botao_lixeira_pressed():
	apagaInstrucoes()

func _process(_delta):
	get_node("../Soma/Label").text = "Some os valores: " + str(guardaValor)
