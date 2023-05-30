extends CanvasLayer

# Exporta as variáveis para serem definidas no inspetor.
export (String, FILE, "*.tscn") var nivelRestart
export (String, FILE, "*.tscn") var voltaMenu

onready var jogador = preload("res://cenas_universais/jogador.tscn")

var posicaoInicialEstagio = [Vector2(103, 135), Vector2(161, 83), Vector2(103, 81), Vector2(43, 133), Vector2(43, 131)]
# 103, 81

# Reinicia a fase.
func _on_restart_pressed():
	global.mudaCena = get_tree().change_scene(nivelRestart)
	global.valorReal = 0
	
	#for i in range(5):
		#if global.estagio == i:
			#global.posicaoJogador = posicaoInicialEstagio[i]
			#break

# Leva ao menu do jogo.
func _on_menu_pressed():
	global.mudaCena = get_tree().change_scene(voltaMenu)
	global.valorReal = 0
