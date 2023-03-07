extends Node

# Define quais cartas aparecerão no início da fase.
func defineCartas(d1, d2):
	get_node("carta1/numero").set_text(str(d1["imagem"]))
	get_node("carta2/numero").set_text(str(d2["imagem"]))

func _ready():
	defineCartas(global.cartaMais2, global.cartaMais2)
