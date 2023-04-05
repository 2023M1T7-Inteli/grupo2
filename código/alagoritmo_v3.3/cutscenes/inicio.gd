extends Node2D


func _ready():
	frame1()
	yield(get_tree().create_timer(5),"timeout")
	frame2()
	yield(get_tree().create_timer(5),"timeout")
	frame3()
	yield(get_tree().create_timer(5),"timeout")
	frame4()
	yield(get_tree().create_timer(5),"timeout")
	fadeout()
	
func frame1():
	$AnimatedSprite.frame = 0
	$textos.visible_characters = 0
	$textos.text = "Aqui começa a saga de Aluado,\nmenino que adora um cordel animado."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame2():
	$AnimatedSprite.frame = 2
	$textos.visible_characters = 0
	$textos.text = "Deitado na cama, com sua história na mão,\nAluado viajava sem sair do chão."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame3():
	$AnimatedSprite.frame = 3
	$textos.visible_characters = 0
	$textos.text = "Mas o sono chegou sem avisar,\ne Aluado não pôde se controlar."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func frame4():
	$AnimatedSprite.frame = 4
	$textos.visible_characters = 0
	$textos.text = "Adormeceu com a história em mente,\ne foi parar num mundo diferente."
	while $textos.visible_characters != len($textos.text):
		$textos.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func fadeout():
	$ColorRect.show()
	var a = 0.0
	while a < 1.0:
		$ColorRect.modulate = Color(1,1,1,a)
		a+=0.1
		yield(get_tree().create_timer(0.05),"timeout")
	yield(get_tree().create_timer(1.5),"timeout")
	get_tree().change_scene("res://cutscenes/inicio_parte2.tscn")
