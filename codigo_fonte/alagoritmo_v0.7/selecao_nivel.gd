extends Control

func _on_play_l1_pressed():
	# Vai para o primeiro nível do jogo
	global.mudaCena = get_tree().change_scene("res://scenes/main.tscn")

func _on_botao_volta_pressed():
	# Retorno para o menu principal
	global.mudaCena = get_tree().change_scene("res://scenes/menu.tscn")
