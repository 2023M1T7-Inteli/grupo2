extends Node

var corCartaSetas = Color(1, 0.8, 0)
var corCartaMat = Color(0.99, 0.43, 0.61)
var corCartaSe = Color(0, 1, 0.42)
var corCartaEsperar = Color(1, 1, 1)
var corDesabilitado = Color(0.33, 0.4, 0.44)

var cartas = []

var opcoes = []

func _ready():
	# Loop que dentro de um range cria uma lista com todos os nodes de cartas da fase.
	for i in range(1, 4):
		var carta = get_node("carta%d/numero" % i)
		cartas.append(carta)
	
	opcoes = [global.setaD, global.esperar, global.setaD]
	
	for i in range(1, 4):
		global["dic" + str(i)] = opcoes[i - 1]

func defineCartas(d1, d2, d3):
	var cartas_imagem = [d1["imagem"], d2["imagem"], d3["imagem"]]
	for i in range(3):
		cartas[i].set_text(cartas_imagem[i])

func _process(_delta):
	defineCartas(global.dic1, global.dic2, global.dic3)
	muda_cor_cartas(global.dic1, global.dic2, global.dic3)

func muda_cor_cartas(d1, d2, d3):
	if d1["tipo"] == "setaD" or d1["tipo"] == "setaE" or d1["tipo"] == "setaC" or d1["tipo"] == "setaB":
		$carta1.modulate = corCartaSetas
	elif d1["tipo"] == "numero":
		$carta1.modulate = corCartaMat
	elif d1["tipo"] == "se":
		$carta1.modulate = corCartaSe
	elif d1["tipo"] == "esperar":
		$carta1.modulate = corCartaEsperar
	
	if d2["tipo"] == "setaD" or d2["tipo"] == "setaE" or d2["tipo"] == "setaC" or d2["tipo"] == "setaB":
		$carta2.modulate = corCartaSetas
	elif d2["tipo"] == "numero":
		$carta2.modulate = corCartaMat
	elif d2["tipo"] == "se":
		$carta2.modulate = corCartaSe
	elif d2["tipo"] == "esperar":
		$carta2.modulate = corCartaEsperar
	
	if d3["tipo"] == "setaD" or d3["tipo"] == "setaE" or d3["tipo"] == "setaC" or d3["tipo"] == "setaB":
		$carta3.modulate = corCartaSetas
	elif d3["tipo"] == "numero":
		$carta3.modulate = corCartaMat
	elif d3["tipo"] == "se":
		$carta3.modulate = corCartaSe
	elif d3["tipo"] == "esperar":
		$carta3.modulate = corCartaEsperar

func _on_carta1_pressed():
	get_node("carta1").disabled = true
	get_node("carta1").modulate = corDesabilitado

func _on_carta2_pressed():
	get_node("carta2").disabled = true
	get_node("carta2").modulate = corDesabilitado

func _on_carta3_pressed():
	get_node("carta3").disabled = true
	get_node("carta3").modulate = corDesabilitado

func _on_botao_lixeira_pressed():
	for i in range(get_child_count()):
		get_node("carta" + str(i+1)).disabled = false

