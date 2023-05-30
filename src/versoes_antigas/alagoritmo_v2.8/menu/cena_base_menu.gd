extends Control

# Retorno para o menu principal
func _on_botao_volta_pressed():
	global.mudaCena = get_tree().change_scene("res://menu/menu.tscn")
