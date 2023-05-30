extends Node2D

func _ready():
	frame10()
	yield(get_tree().create_timer(5),"timeout")
	frame11()
	yield(get_tree().create_timer(5),"timeout")
	transicaoDeCor()
	yield(get_tree().create_timer(7),"timeout")
	frame36()
	yield(get_tree().create_timer(5),"timeout")
	subidaParaBatalha()
	yield(get_tree().create_timer(5),"timeout")
	get_tree().change_scene("res://niveis/cordel2/bossSol/bossSol.tscn")

func frame10():
	$AnimatedSprite.frame = 10
	$textos.visible_characters = 0
	$textos.text = "No mundo de cordel, agora tudo é colorido,\nAluado fez um feito jamais visto."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame11():
	$AnimatedSprite.frame = 12
	$textos.visible_characters = 0
	$textos.text = "Lume pediu com gentileza pelos cristais,\nMas Aluado já sabia de sua falsidade."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func transicaoDeCor():
	var nFrame = 13
	while nFrame != 36:
		$AnimatedSprite.frame = nFrame
		yield(get_tree().create_timer(0.07),"timeout")
		nFrame += 1
	$textos.visible_characters = 0
	$textos.text = "De repente, Lume se revelou o grande mal, \nO responsável pela falta de cores no cordel."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame36():
	$AnimatedSprite.frame = 36
	$textos.visible_characters = 0
	$textos.text = "Um inimigo terrível que fará Aluado batalhar, \nUm combate épico que deixará a terra ao léu."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func subidaParaBatalha():
	var nFrame = 37
	while nFrame != 46:
		$AnimatedSprite.frame = nFrame
		yield(get_tree().create_timer(0.05),"timeout")
		nFrame += 1
	$textos.visible_characters = 0
	$textos.text = "O destino do cordel está em jogo, é hora de lutar \nQuem sairá vitorioso? É algo difícil de adivinhar."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")
