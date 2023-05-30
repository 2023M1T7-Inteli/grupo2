extends Node2D


func _on_TextureButton_pressed():
	#Se o botão com a seta para a esquerda for pressionado, o jogo voltará para a tela de informações
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/Tela_informacoes.tscn")

func _on_TextureButton2_pressed():
	# Se o botão com a palavra "Como Jogar" for pressionado, o jogo mostrará a tela de Como jogar
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/instrucoes/como_jogar/Tela_como_jogar.tscn")

func _on_TextureButton3_pressed():
	# Se o botão com a palavra "Extras" for pressionado, o jogo mostrará a tela de Informaões adicionais
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/instrucoes/info_adicionais/Tela_extras.tscn")
