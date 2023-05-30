extends TextureButton

func _on_botaoVoltaMenu_pressed():
	global.mudaCena = get_tree().change_scene("res://menu/menu.tscn")
