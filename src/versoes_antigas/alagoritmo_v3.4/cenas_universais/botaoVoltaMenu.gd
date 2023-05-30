extends TextureButton

# Botão para retornar ao menu quando clicado
func _on_botaoVoltaMenu_pressed():
	global.mudaCena = get_tree().change_scene("res://menu/menu.tscn")
