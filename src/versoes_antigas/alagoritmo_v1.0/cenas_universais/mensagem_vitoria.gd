extends CanvasLayer

export (String, FILE, "*.tscn") var nivelRestart
export (String, FILE, "*.tscn") var nivelProximo

func _on_restart_pressed():
	global.mudaCena = get_tree().change_scene(nivelRestart)
	global.valorReal = 0

func _on_proximaFase_pressed():
	global.mudaCena = get_tree().change_scene(nivelProximo)
	global.valorReal = 0
