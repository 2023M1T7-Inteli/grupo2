extends Node2D

func _on_TextureButton2_pressed():
	# Se o botão com a palavra "informações" for pressionado, o jogo mostrará a tela de informações
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/Tela_informacoes.tscn")
