extends CanvasLayer

# Exporta as variáveis para serem definidas no inspetor.
export (String, FILE, "*.tscn") var nivelRestart
export (String, FILE, "*.tscn") var nivelProximo

# Reinicia a fase.
func _on_restart_pressed():
	global.mudaCena = get_tree().change_scene(nivelRestart)
	global.valorReal = 0

# Leva à próxima fase.
func _on_proximaFase_pressed():
	global.mudaCena = get_tree().change_scene(nivelProximo)
	global.valorReal = 0
