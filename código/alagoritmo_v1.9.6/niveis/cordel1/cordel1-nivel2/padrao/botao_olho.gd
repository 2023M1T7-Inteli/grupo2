extends TextureButton

func _on_botao_olho_pressed():
	global.mudaCena = get_tree().change_scene("res://niveis/cordel1/cordel1-nivel2/nivel2.tscn")
