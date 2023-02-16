extends Control

func _on_play_pressed():
	# Vai para a seleção de níveis
	global.mudaCena = get_tree().change_scene("res://menu/selecao_nivel.tscn")

func _on_info_pressed():
	# Vai para uma tela genérica que futuramente adicionaremos informações
	global.mudaCena = get_tree().change_scene("res://menu/cena_base_menu.tscn")

func _on_config_pressed():
	# Vai para uma tela genérica que futuramente adicionaremos configurações
	global.mudaCena = get_tree().change_scene("res://menu/cena_base_menu.tscn")
