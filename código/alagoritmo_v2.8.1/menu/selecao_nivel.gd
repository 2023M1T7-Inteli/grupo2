extends Control

var texturaCadeado = ResourceLoader.load("res://assets/cadeado.png")
var texturaFaseLume = ResourceLoader.load("res://assets/fase_lume.png")

func _on_play_l1_pressed():
	# Vai para o primeiro nível do jogo
	global.mudaCena = get_tree().change_scene("res://niveis/cordel1/nivel1/nivel1.tscn")

func _on_botao_volta_pressed():
	# Retorno para o menu principal
	global.mudaCena = get_tree().change_scene("res://menu/menu.tscn")

func _ready():
	if global.passouNivelCangaceiro == false:
		$play_l2.texture_normal = texturaCadeado
	elif global.passouNivelCangaceiro == true:
		$play_l2.texture_normal = texturaFaseLume

func _on_play_l2_pressed():
	if global.passouNivelCangaceiro == true:
		global.mudaCena = get_tree().change_scene("res://niveis/cordel2/c2_nivel1/c2_nivel1.tscn")
