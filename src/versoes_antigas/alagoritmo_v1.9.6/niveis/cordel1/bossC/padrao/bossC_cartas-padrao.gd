extends Node

var corCartaSetas = Color(1, 0.8, 0)
var corCartaMat = Color(0.99, 0.43, 0.61)
var corCartaSe = Color(0, 1, 0.42)

var dic1 = global.setaD
var dic2 = global.setaD
var dic3 = global.setaE

onready var carta1 = get_node("carta1/numero")
onready var carta2 = get_node("carta2/numero")
onready var carta3 = get_node("carta3/numero")

onready var cartas = [carta1, carta2, carta3]

func defineCartas(d1, d2, d3):
	cartas[0].set_text(d1["imagem"])
	cartas[1].set_text(d2["imagem"])
	cartas[2].set_text(d3["imagem"])

func _ready():
	defineCartas(dic1, dic2, dic3)
	muda_cor_cartas(dic1, dic2, dic3)

func muda_cor_cartas(d1, d2, d3):
	if d1["tipo"] == "setaD" or d1["tipo"] == "setaE":
		$carta1.modulate = corCartaSetas
	elif d1["tipo"] == "numero":
		$carta1.modulate = corCartaMat
	elif d1["tipo"] == "se":
		$carta1.modulate = corCartaSe

	if d2["tipo"] == "setaD" or d2["tipo"] == "setaE":
		$carta2.modulate = corCartaSetas
	elif d2["tipo"] == "numero":
		$carta2.modulate = corCartaMat
	elif d2["tipo"] == "se":
		$carta2.modulate = corCartaSe

	if d3["tipo"] == "setaD" or d3["tipo"] == "setaE":
		$carta3.modulate = corCartaSetas
	elif d3["tipo"] == "numero":
		$carta3.modulate = corCartaMat
	elif d3["tipo"] == "se":
		$carta3.modulate = corCartaSe
