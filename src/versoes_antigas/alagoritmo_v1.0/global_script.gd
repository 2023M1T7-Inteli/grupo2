extends Node

# Definição de variáveis globais para todas as cenas

var ordemCartas = [] # Armazena qual tipo de carta será usada.
var mudaCena # Armazena o valor que a função "change_scene()" gera.

# Variáveis do inimigo: --------------------------------------------------------
var valorAtaqueInimigo = -6

# DICIONÁRIOS MATEMÁTICA #######################################################

var valorReal = 0 # Valor usado para contas e validações das contas do dicionário

# Os dicionários de matemática têm 3 parâmetros em comum:
	# valorFigurativo: É exibido nos parâmetros .text dos nodes
	# sinal: Determina se o número é positivo ou negativo

var cartaMais1 = {
	"valorFigurativo": 1,
	"sinal": "+"
}

var cartaMais2 = {
	"valorFigurativo": 2,
	"sinal": "+"
}

var cartaMais3 = {
	"valorFigurativo": 3,
	"sinal": "+"
}

var cartaMais4 = {
	"valorFigurativo": 4,
	"sinal": "+"
}

var cartaMais5 = {
	"valorFigurativo": 5,
	"sinal": "+"
}

var cartaMais6 = {
	"valorFigurativo": 6,
	"sinal": "+"
}

var cartaMais7 = {
	"valorFigurativo": 7,
	"sinal": "+"
}

var cartaMais8 = {
	"valorFigurativo": 8,
	"sinal": "+"
}

var cartaMais9 = {
	"valorFigurativo": 9,
	"sinal": "+"
}

var cartaMais10 = {
	"valorFigurativo": 10,
	"sinal": "+"
}

# DICIONÁRIOS SETAS ############################################################

# Os dicionários de setas têm 2 parâmetros em comum:
	# valor: Utilizado na variável "ordemCartas" para definir a movimentação.
	# imagem: Determina a imagem que aparecerá nas instruções.

var setaD = {
	"valor": "direita",
	"imagem": "-->"
}

var setaE = {
	"valor": "esquerda",
	"imagem": "<--"
}


