extends Node2D

func _on_TextureButton_pressed():
	#Se o botão com a seta para a esquerda for pressionado, o jogo voltará para a tela de instruções
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/instrucoes/Tela_instrucoes.tscn")
