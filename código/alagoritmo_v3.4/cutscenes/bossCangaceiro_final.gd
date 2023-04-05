extends Node2D

func _ready():
	yield(get_tree().create_timer(1),"timeout")
	fala1()
	yield(get_tree().create_timer(2),"timeout")
	fade_cangaceiro()
	yield(get_tree().create_timer(2),"timeout")
	fade_fundo()
	yield(get_tree().create_timer(2),"timeout")
	fala2()
	yield(get_tree().create_timer(2),"timeout")
	fala3()
	yield(get_tree().create_timer(2),"timeout")
	get_tree().change_scene("res://niveis/cordel2/c2_nivel1/c2_nivel1.tscn")
	
func fala1():
	$falas_cangaceiro.visible_characters = 0
	$falas_cangaceiro.text = "O quê?? Mas como???"
	while $falas_cangaceiro.visible_characters != len($falas_cangaceiro.text):
		$falas_cangaceiro.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func fala2():
	$falas_cangaceiro.visible_characters = 0
	$falas_cangaceiro.text = "Você venceu, jovem guerreiro"
	while $falas_cangaceiro.visible_characters != len($falas_cangaceiro.text):
		$falas_cangaceiro.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

func fala3():
	$falas_cangaceiro.visible_characters = 0
	$falas_cangaceiro.text = "Pegue o fragmento do cristal"
	while $falas_cangaceiro.visible_characters != len($falas_cangaceiro.text):
		$falas_cangaceiro.visible_characters += 1
		yield(get_tree().create_timer(0.05),"timeout")

var aFundo = 1
func fade_fundo():
	while aFundo != 0:
		$background.modulate = Color(1,1,1,aFundo)
		aFundo-=0.05
		yield(get_tree().create_timer(0.05),"timeout")

var aCangaceiro = 1
func fade_cangaceiro():
	while aCangaceiro != 0:
		$boss_pretoebranco/boss.modulate = Color(1,1,1,aCangaceiro)
		aCangaceiro-=0.05
		yield(get_tree().create_timer(0.05),"timeout")

func _process(delta):
	$boss_pretoebranco/boss.frame = $boss_colorido/boss.frame
