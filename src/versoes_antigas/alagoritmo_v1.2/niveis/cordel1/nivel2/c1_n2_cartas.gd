extends Node

func defineCartas(d1, d2):
	get_node("carta1/numero").set_text(str(d1["sinal"], d1["valorFigurativo"]))
	get_node("carta2/numero").set_text(str(d2["sinal"], d2["valorFigurativo"]))

func _ready():
	defineCartas(global.cartaMais2, global.cartaMais2)
