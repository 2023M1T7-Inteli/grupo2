extends Node

# Organização das cores das cartas.
var corCartaSetas = Color(1, 0.8, 0)
var corCartaMat = Color(0.99, 0.43, 0.61)
var corCartaSe = Color(0, 1, 0.42)
var corCartaEsperar = Color(1, 1, 1)
var corDesabilitado = Color(0.33, 0.4, 0.44)

var cartas = [] # Guarda as cartas usadas na fase em um array.
var opcoes = [] # Registra as opções que serão guardadas nos dics.
var listaDeCartas = []

var tamanhoMax = 3 # Máximo de cartas da fase.

var texture

var mudaCorDesabilitado = [false, false, false, false, false] # Cartas estão habilitadas.

func defineCartas(d1, d2, d3):
	var cartasImagem = [d1["imagem"], d2["imagem"], d3["imagem"]]
	listaDeCartas = [$carta0, $carta1, $carta2]
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

func muda_cor_cartas(d1, d2, d3):
	var dicionarios = [d1, d2, d3]
	listaDeCartas = [$carta0, $carta1, $carta2]
	
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
			else:
				listaDeCartas[i].modulate = Color(1, 1, 1)

func _on_carta0_pressed():
	$carta0.disabled = true
	mudaCorDesabilitado[0] = true
	
func _on_carta1_pressed():
	$carta1.disabled = true
	mudaCorDesabilitado[1] = true
	
func _on_carta2_pressed():
	$carta2.disabled = true
	mudaCorDesabilitado[2] = true

func _on_botao_lixeira_pressed():
	mudaCorDesabilitado = [false, false, false, false, false]
	for i in range(get_child_count()):
		get_node("carta" + str(i)).disabled = false

func _on_botao_pronto_pressed():
	yield(get_tree().create_timer(1.4), "timeout")
	mudaCorDesabilitado = [false, false, false, false, false]
	for i in range(get_child_count()):
		get_node("carta" + str(i)).disabled = false

func _ready():
	# Loop que dentro de um range cria uma lista com todos os nodes de cartas da fase.
	for i in range(tamanhoMax):
		var carta = get_node("carta%d/numero" % i)
		cartas.append(carta)
	
	opcoes = [global.setaD, global.esperar, global.setaD]
	
	for i in range(tamanhoMax):
		global["dic" + str(i)] = opcoes[i]

func _process(_delta):
	defineCartas(global.dic0, global.dic1, global.dic2)
	muda_cor_cartas(global.dic0, global.dic1, global.dic2)