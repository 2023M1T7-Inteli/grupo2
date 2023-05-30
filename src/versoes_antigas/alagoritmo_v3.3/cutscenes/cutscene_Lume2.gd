extends Node2D

func _ready():
	frame46()
	yield(get_tree().create_timer(5),"timeout")
	frame46_2()
	yield(get_tree().create_timer(5),"timeout")
	frame47()
	yield(get_tree().create_timer(5),"timeout")
	frame47_2()
	yield(get_tree().create_timer(5),"timeout")
	frame48()
	yield(get_tree().create_timer(5),"timeout")
	frame48_2()
	yield(get_tree().create_timer(5),"timeout")
	get_tree().change_scene("res://cutscenes/creditos.tscn")

func frame46():
	$AnimatedSprite.frame = 46
	$textos.visible_characters = 0
	$textos.text = "Com coragem e muita astúcia,\nAluado enfrentou o vilão."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame46_2():
	$AnimatedSprite.frame = 46
	$textos.visible_characters = 0
	$textos.text = "Derrotou Lume com maestria,\nE venceu essa grande missão."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame47():
	$AnimatedSprite.frame = 46
	$textos.visible_characters = 0
	$textos.text = "Aluado percebeu a dor no olhar do vilão, \nE viu que não era só maldade que havia lá."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame47_2():
	$AnimatedSprite.frame = 46
	$textos.visible_characters = 0
	$textos.text = "Entendeu que a tristeza era a raiz do mal, \nE que Lume só queria ser lembrado afinal."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame48():
	$AnimatedSprite.frame = 46
	$textos.visible_characters = 0
	$textos.text = "Aluado estendeu sua mão amiga, \nE disse que iria ajudá-lo a ser lembrado."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame48_2():
	$AnimatedSprite.frame = 46
	$textos.visible_characters = 0
	$textos.text = "Contando histórias com cordel e amor, \nPara que nunca mais fosse esquecido o seu valor."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")
