extends Node2D

func _on_TextureButton_pressed():
	#Se o botão com a seta para a esquerda for pressionado, o jogo voltará para a tela do menu principal
	global.mudaCena = get_tree().change_scene("res://menu/menu.tscn")


func _on_TextureButton2_pressed():
	# Se o botão com a palavra "CARTAS" for pressionado, o jogo mostrará a tela de cartas
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/cartas/Tela_cartas.tscn")

func _on_TextureButton3_pressed():
	# Se o botão com a palavra "INSTRUÇÕES" for pressionado, o jogo mostrará a tela de Instruções
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/instrucoes/Tela_instrucoes.tscn")

func _on_TextureButton4_pressed():
	# Se o botão com a palavra "CRÉDITOS" for pressionado, o jogo mostrará a tela de Créditos
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/creditos/Tela_creditos.tscn")


func _on_TextureButton5_pressed():
	# Se o botão com a palavra "HISTÓRIA" for pressionado, o jogo mostrará a tela da Sinopse do Jogo
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/historia/Tela_historia.tscn")
