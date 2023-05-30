extends Node

func defineCartas(d1, d2, d3):
	get_node("carta1/numero").set_text(d1["imagem"])
	get_node("carta2/numero").set_text(d2["imagem"])
	get_node("carta3/numero").set_text(d3["imagem"])
	pass

func _ready():
	defineCartas(global.se, global.setaD, global.cartaMais1)
	pass
