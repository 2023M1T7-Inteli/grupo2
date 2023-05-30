extends CanvasLayer

# Exporta as variáveis para serem definidas no inspetor.
export (String, FILE, "*.tscn") var nivelRestart
export (String, FILE, "*.tscn") var voltaMenu

# Reinicia a fase.
func _on_restart_pressed():
	global.mudaCena = get_tree().change_scene(nivelRestart)
	global.valorReal = 0

# Leva ao menu do jogo.
func _on_menu_pressed():
	global.mudaCena = get_tree().change_scene(voltaMenu)
	global.valorReal = 0
