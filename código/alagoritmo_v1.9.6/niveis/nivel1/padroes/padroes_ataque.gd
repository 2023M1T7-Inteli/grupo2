extends Node2D

export (String, FILE, "*.tscn") var nivel
var tamanhoMaximo = 3

func _on_voltarNivel_pressed():
	global.mudaCena = get_tree().change_scene(nivel)
	global.valorReal = 0

func mostrar_bordas():
	for i in range(tamanhoMaximo):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()


func _on_botao_pronto_pressed():
	mostrar_bordas()
