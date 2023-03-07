extends Node

# Define quais cartas aparecerão no início da fase.
func defineCartas(d1, d2):
	get_node("carta1/numero").set_text(str(d1["valor"]))
	get_node("carta2/numero").set_text(str(d2["valor"]))

func _ready():
	defineCartas(global.cartaMais4, global.cartaMais10)
