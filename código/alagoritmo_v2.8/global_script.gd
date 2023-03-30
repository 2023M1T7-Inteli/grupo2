extends Node

# Definição de variáveis globais para todas as cenas

var ordemCartas = [] # Armazena a ordem das cartas que serão usadas.
var tipoCartas = [] # Armazena os tipos de cartas que serão usadas.
var mudaCena # Armazena o valor que a função "change_scene()" gera.
var moveAndSlide # Armazena o valor que a função "move_and_slide()" gera.
var estagio = 0 # VARIÁVEL QUE TALVEZ VAMOS USAR MAIS TARDE
var estagioSave

# Variávels para pegar a posição do jogador e mantê-la ao longo das cenas.
var posicaoJogador

var vidaJogador

var guardaImagemInstrucoes = []

var levouDano = 0

var vezQueEntrouNoNivel3 = 0
var vezQueEntrouNoNivelBoss = 0
var vezQueEntrouNoNivelLume = 0

var vidaCangaceiro = 5

var nivelLume = false # VERIFICA SE O JOGADOR ESTÁ O NÍVEL DO LUME (AJUSTAR POSTERIORMENTE)

var passouNivelCangaceiro = false # VERIFICA SE O JOGADOR PASSOU DA FASE DO CANGACEIRO P/ LIBERAR A FASE DO LUME.

var controleMudaCartas = true # VARIÁVEL DE CONTROLE PARA GARANTIR QUE AS CARTAS NÃO MUDEM NO BOTÃO DE PADRÃO

# TESTE DE OTIMIZAÇÃO DOS DICS
var dic0
var dic1
var dic2
var dic3
var dic4

var resposta = 0 # VARIÁVEL PARA ARMAZENAR A RESPOSTA EM TODOS OS ESTÁGIOS


# Variáveis do inimigo: --------------------------------------------------------
var valorAtaqueInimigo = -6

# DICIONÁRIOS INIMIGOS #########################################################

var inimigoIf = {
	"valorAtaque": -1,
	"tipo": "se"
}

# DICIONÁRIOS MATEMÁTICA #######################################################

var valorReal = 0 # Valor usado para contas e validações das contas do dicionário

# Os dicionários de matemática têm 3 parâmetros em comum:
	# valorFigurativo: É exibido nos parâmetros .text dos nodes
	# sinal: Determina se o número é positivo ou negativo

# CARTAS POSITIVAS
var cartaMais1 = {
	"valor": 1,
	"imagem": "+1",
	"tipo": "numero"
}

var cartaMais2 = {
	"valor": 2,
	"imagem": "+2",
	"tipo": "numero"
}

var cartaMais3 = {
	"valor": 3,
	"imagem": "+3",
	"tipo": "numero"
}

var cartaMais4 = {
	"valor": 4,
	"imagem": "+4",
	"tipo": "numero"
}

var cartaMais5 = {
	"valor": 5,
	"imagem": "+5",
	"tipo": "numero"
}

var cartaMais6 = {
	"valor": 6,
	"imagem": "+6",
	"tipo": "numero"
}

var cartaMais7 = {
	"valor": 7,
	"imagem": "+7",
	"tipo": "numero"
}

var cartaMais8 = {
	"valor": 8,
	"imagem": "+8",
	"tipo": "numero"
}

var cartaMais9 = {
	"valor": 9,
	"imagem": "+9",
	"tipo": "numero"
}

var cartaMais10 = {
	"valor": 10,
	"imagem": "+10",
	"tipo": "numero"
}

# CARTAS NEGATIVAS
var cartaMenos1 = {
	"valor": -1,
	"imagem": "-1",
	"tipo": "numero"
}

var cartaMenos2 = {
	"valor": -2,
	"imagem": "-2",
	"tipo": "numero"
}

var cartaMenos3 = {
	"valor": -3,
	"imagem": "-3",
	"tipo": "numero"
}

var cartaMenos4 = {
	"valor": -4,
	"imagem": "-4",
	"tipo": "numero"
}

var cartaMenos5 = {
	"valor": -5,
	"imagem": "-5",
	"tipo": "numero"
}

var cartaMenos6 = {
	"valor": -6,
	"imagem": "-6",
	"tipo": "numero"
}

var cartaMenos7 = {
	"valor": -7,
	"imagem": "-7",
	"tipo": "numero"
}

var cartaMenos8 = {
	"valor": -8,
	"imagem": "-8",
	"tipo": "numero"
}

var cartaMenos9 = {
	"valor": -9,
	"imagem": "-9",
	"tipo": "numero"
}

var cartaMenos10 = {
	"valor": -10,
	"imagem": "-10",
	"tipo": "numero"
}

# DICIONÁRIOS SETAS ############################################################

# Os dicionários de setas têm 2 parâmetros em comum:
	# valor: Utilizado na variável "ordemCartas" para definir a movimentação.
	# imagem: Determina a imagem que aparecerá nas instruções.

var setaD = {
	"valor": "direita",
	"imagem": "-->",
	"tipo": "setaD"
}

var setaE = {
	"valor": "esquerda",
	"imagem": "<--",
	"tipo": "setaE"
}

var setaC = {
	"valor": "cima",
	"imagem": "^",
	"tipo": "setaC"
}

var setaB = {
	"valor": "baixo",
	"imagem": "v",
	"tipo": "setaB"
}

# DICIONÁRIOS PROGRAMAÇÃO ######################################################

var se = {
	"valor": "se",
	"imagem": "SE",
	"tipo": "se"
}

var esperar = {
	"valor": "esperar",
	"imagem": "res://assets/esperar.png",
	"tipo": "esperar"
}

var looping = {
	"valor": "looping",
	"imagem": "res://assets/looping.png",
	"tipo": "looping"
}
