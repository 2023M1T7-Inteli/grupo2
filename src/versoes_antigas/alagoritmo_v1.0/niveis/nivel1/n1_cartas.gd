extends Node

func defineCartas(d1, d2, d3):
	get_node("carta1/numero").set_text(str(d1["sinal"], d1["valorFigurativo"]))
	get_node("carta2/numero").set_text(str(d2["sinal"], d2["valorFigurativo"]))
	get_node("carta3/numero").set_text(str(d3["sinal"], d3["valorFigurativo"]))
	pass

func _ready():
	defineCartas(global.cartaMais3, global.cartaMais3, global.cartaMais10)
	pass
