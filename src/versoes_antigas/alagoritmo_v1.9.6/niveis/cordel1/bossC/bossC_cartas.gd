extends Node

var corCartaSetas = Color(1, 0.8, 0)
var corCartaMat = Color(0.99, 0.43, 0.61)
var corCartaSe = Color(0, 1, 0.42)
var corCartaEsperar = Color(1, 1, 1)
var corDesabilitado = Color(0.33, 0.4, 0.44)

var cartas = []

var opcoes = []

var mudaCorParaDesabilitado1 = false
var mudaCorParaDesabilitado2 = false
var mudaCorParaDesabilitado3 = false
var mudaCorParaDesabilitado4 = false
var mudaCorParaDesabilitado5 = false

func _ready():
	# Loop que dentro de um range cria uma lista com todos os nodes de cartas da fase.
	for i in range(1, 6):
		var carta = get_node("carta%d/numero" % i)
		cartas.append(carta)
	
	opcoes = [global.cartaMais4, global.setaC, global.cartaMais2, global.esperar, global.setaD]
	opcoes.shuffle()
	
	for i in range(1, 6):
		global["dic" + str(i)] = opcoes[i - 1]

func defineCartas(d1, d2, d3, d4, d5):
	var cartas_imagem = [d1["imagem"], d2["imagem"], d3["imagem"], d4["imagem"], d5["imagem"]]
	for i in range(5):
		cartas[i].set_text(cartas_imagem[i])

func _process(_delta):
	if global.estagio == 5:
		defineCartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
		muda_cor_cartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
	if global.estagio == 4:
		opcoes = [global.setaE, global.cartaMais9, global.setaD, global.setaE, global.setaB]
		for i in range(1, 6):
			global["dic" + str(i)] = opcoes[i - 1]
		defineCartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
		muda_cor_cartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
	elif global.estagio == 3:
		opcoes = [global.cartaMais6, global.esperar, global.setaE, global.esperar, global.setaB]
		for i in range(1, 6):
			global["dic" + str(i)] = opcoes[i - 1]
		defineCartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
		muda_cor_cartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
	elif global.estagio == 2:
		opcoes = [global.setaC, global.cartaMais8, global.cartaMais2, global.cartaMais1, global.setaB]
		for i in range(1, 6):
			global["dic" + str(i)] = opcoes[i - 1]
		defineCartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
		muda_cor_cartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
	elif global.estagio == 1:
		opcoes = [global.cartaMais9, global.cartaMais7, global.cartaMais4, global.cartaMais1, global.cartaMais2]
		for i in range(1, 6):
			global["dic" + str(i)] = opcoes[i - 1]
		defineCartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)
		muda_cor_cartas(global.dic1, global.dic2, global.dic3, global.dic4, global.dic5)

func muda_cor_cartas(d1, d2, d3, d4, d5):
	if mudaCorParaDesabilitado1 == true:
		$carta1.modulate = corDesabilitado
	else:
		if d1["tipo"] == "setaD" or d1["tipo"] == "setaE" or d1["tipo"] == "setaC" or d1["tipo"] == "setaB":
			$carta1.modulate = corCartaSetas
		elif d1["tipo"] == "numero":
			$carta1.modulate = corCartaMat
		elif d1["tipo"] == "se":
			$carta1.modulate = corCartaSe
		elif d1["tipo"] == "esperar":
			$carta1.modulate = corCartaEsperar
	
	if mudaCorParaDesabilitado2 == true:
		$carta2.modulate = corDesabilitado
	else:
		if d2["tipo"] == "setaD" or d2["tipo"] == "setaE" or d2["tipo"] == "setaC" or d2["tipo"] == "setaB":
			$carta2.modulate = corCartaSetas
		elif d2["tipo"] == "numero":
			$carta2.modulate = corCartaMat
		elif d2["tipo"] == "se":
			$carta2.modulate = corCartaSe
		elif d2["tipo"] == "esperar":
			$carta2.modulate = corCartaEsperar
	
	if mudaCorParaDesabilitado3 == true:
		$carta3.modulate = corDesabilitado
	else:
		if d3["tipo"] == "setaD" or d3["tipo"] == "setaE" or d3["tipo"] == "setaC" or d3["tipo"] == "setaB":
			$carta3.modulate = corCartaSetas
		elif d3["tipo"] == "numero":
			$carta3.modulate = corCartaMat
		elif d3["tipo"] == "se":
			$carta3.modulate = corCartaSe
		elif d3["tipo"] == "esperar":
			$carta3.modulate = corCartaEsperar
	
	if mudaCorParaDesabilitado4 == true:
		$carta4.modulate = corDesabilitado
	else:
		if d4["tipo"] == "setaD" or d4["tipo"] == "setaE" or d4["tipo"] == "setaC" or d4["tipo"] == "setaB":
			$carta4.modulate = corCartaSetas
		elif d4["tipo"] == "numero":
			$carta4.modulate = corCartaMat
		elif d4["tipo"] == "se":
			$carta4.modulate = corCartaSe
		elif d4["tipo"] == "esperar":
			$carta4.modulate = corCartaEsperar
	
	if mudaCorParaDesabilitado5 == true:
		$carta5.modulate = corDesabilitado
	else:
		if d5["tipo"] == "setaD" or d5["tipo"] == "setaE" or d5["tipo"] == "setaC" or d5["tipo"] == "setaB":
			$carta5.modulate = corCartaSetas
		elif d5["tipo"] == "numero":
			$carta5.modulate = corCartaMat
		elif d5["tipo"] == "se":
			$carta5.modulate = corCartaSe
		elif d5["tipo"] == "esperar":
			$carta5.modulate = corCartaEsperar

func reabilitaCartas():
	if global.estagio == 4:
		for i in range(get_child_count()):
			get_node("carta" + str(i+1)).disabled = false

func _on_carta1_pressed():
	mudaCorParaDesabilitado1 = true
	get_node("carta1").disabled = true

func _on_carta2_pressed():
	mudaCorParaDesabilitado2 = true
	get_node("carta2").disabled = true

func _on_carta3_pressed():
	mudaCorParaDesabilitado3 = true
	get_node("carta3").disabled = true

func _on_carta4_pressed():
	mudaCorParaDesabilitado4 = true
	get_node("carta4").disabled = true

func _on_carta5_pressed():
	mudaCorParaDesabilitado5 = true
	get_node("carta5").disabled = true

func _on_botao_lixeira_pressed():
	mudaCorParaDesabilitado1 = false
	mudaCorParaDesabilitado2 = false
	mudaCorParaDesabilitado3 = false
	mudaCorParaDesabilitado4 = false
	mudaCorParaDesabilitado5 = false
	for i in range(get_child_count()):
		get_node("carta" + str(i+1)).disabled = false

func _on_botao_pronto_pressed():
	yield(get_tree().create_timer(1.4), "timeout")
	mudaCorParaDesabilitado1 = false
	mudaCorParaDesabilitado2 = false
	mudaCorParaDesabilitado3 = false
	mudaCorParaDesabilitado4 = false
	mudaCorParaDesabilitado5 = false
	for i in range(get_child_count()):
		get_node("carta" + str(i+1)).disabled = false
