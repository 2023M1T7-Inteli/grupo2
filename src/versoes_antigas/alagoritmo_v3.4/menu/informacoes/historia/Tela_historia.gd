extends Node2D

func _on_TextureButton_pressed():
	#Se o botão com a seta para a esquerda for pressionado, o jogo voltará para a tela de informações
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/Tela_informacoes.tscn")

func _on_Button_pressed():
	OS.shell_open("https://docs.google.com/document/d/1EEntEbpoMxJFLGPAsPr16n96g_bd3Fmm1Wt_mVEWNkQ/edit?usp=sharing")

