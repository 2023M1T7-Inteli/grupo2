extends Node

# Organização das cores das cartas.
var corCartaSetas = Color(1, 0.8, 0)
var corCartaMat = Color(0.99, 0.43, 0.61)
var corCartaSe = Color(0, 1, 0.42)
var corCartaEsperar = Color(1, 1, 1)
var corDesabilitado = Color(0.33, 0.4, 0.44)

var cartas = [] # Guarda as cartas usadas na fase em um array.
var opcoes = [] # Registra as opções que serão guardadas nos dics.
var listaDeCartas = [] # Guarda as cartas nesse array.

var tamanhoMax = 2 # Máximo de cartas da fase.

var texture # Guarda o valor que será usado no parâmetro texture das cartas.

var mudaCorDesabilitado = [false, false, false, false, false] # Cartas estão habilitadas.

# Define qual será a carta que será carregada dependendo dos estágios.
func defineCartas(d1, d2):
	var cartasImagem = [d1["imagem"], d2["imagem"]]
	listaDeCartas = [$carta0, $carta1]
	for i in range(tamanhoMax):
		if cartasImagem[i].find("res://") != -1:
			cartas[i].set_text("")
			texture = ResourceLoader.load(cartasImagem[i])
			if texture:
				listaDeCartas[i].texture_normal = texture
		else:
			texture = ResourceLoader.load("res://assets/base_cartas.png")
			listaDeCartas[i].texture_normal = texture
			cartas[i].set_text(cartasImagem[i])

# Muda a cor das cartas dependendo do tipo de carta que foi carregada.
func muda_cor_cartas(d1, d2):
	var dicionarios = [d1, d2]
	listaDeCartas = [$carta0, $carta1]
	
	for i in len(dicionarios):
		if mudaCorDesabilitado[i] == true:
			listaDeCartas[i].modulate = corDesabilitado
		else:
			if dicionarios[i]["tipo"] == "setaD" or dicionarios[i]["tipo"] == "setaE" or dicionarios[i]["tipo"] == "setaC" or dicionarios[i]["tipo"] == "setaB":
				listaDeCartas[i].modulate = corCartaSetas
			elif dicionarios[i]["tipo"] == "numero":
				listaDeCartas[i].modulate = corCartaMat
			elif dicionarios[i]["tipo"] == "se":
				listaDeCartas[i].modulate = corCartaSe
			elif dicionarios[i]["tipo"] == "esperar":
				listaDeCartas[i].modulate = corCartaEsperar

func tocaSomCarta():
	get_node("../sons/cliqueCarta_som").play()
	yield(get_tree().create_timer(1), "timeout")
	get_node("../sons/cliqueCarta_som").stop()

func _on_carta0_pressed():
	get_node("../mao_carta1").hide()
	get_node("../mao_carta2").show()
	$carta1.disabled = false
	$carta0.disabled = true
	mudaCorDesabilitado[0] = true
	tocaSomCarta()
	
func _on_carta1_pressed():
	get_node("../mao_carta2").hide()
	get_node("../mao_pronto").show()
	$carta1.disabled = true
	mudaCorDesabilitado[1] = true
	tocaSomCarta()

# Tira a cor desabilitada das cartas e as reabilitam.
func _on_botao_lixeira_pressed():
	mudaCorDesabilitado = [false, false, false, false, false]
	for i in range(get_child_count()):
		get_node("carta" + str(i)).disabled = false
	
	tocaSomCarta()

# Tira a cor desabilitada das cartas e as reabilitam.
func _on_botao_pronto_pressed():
	for i in range(get_child_count()):
		get_node("carta" + str(i)).disabled = true
	yield(get_tree().create_timer(1.4), "timeout")
	mudaCorDesabilitado = [false, false, false, false, false]
	for i in range(get_child_count()):
		get_node("carta" + str(i)).disabled = false
	
	tocaSomCarta()

func _ready():
	# Loop que dentro de um range cria uma lista com todos os nodes de cartas da fase.
	$carta1.disabled = true
	for i in range(tamanhoMax):
		var carta = get_node("carta%d/numero" % i)
		cartas.append(carta)
	
	# No array opcoes ficam as cartas que serão usadas na fase.
	opcoes = [global.looping, global.setaD]
	
	# Para cada i define as cartas de acordo com o índice do array.
	for i in range(tamanhoMax):
		global["dic" + str(i)] = opcoes[i]

func _process(_delta):
	# If's que verificam o estágio em que o jogo se encontra e se pode mudar as cartas e cor.
	defineCartas(global.dic0, global.dic1)
	muda_cor_cartas(global.dic0, global.dic1)
