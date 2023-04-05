extends Node2D

onready var logo = get_node("AnimatedSprite")
var a = 0.0 #Variável para controlar opacidade do logo

func _ready():
	while a < 1.0: # Fade-in ao iniciar a cena 
		logo.modulate = Color(1,1,1, a)
		a += 0.1
		yield(get_tree().create_timer(0.09),"timeout")
		
	logo.play("default") # Roda animação do logo
	yield(logo,"animation_finished")
	
	while a > 0.0: # Fade-out ao finalizar animação
		logo.modulate = Color(1,1,1, a)
		a -= 0.1
		yield(get_tree().create_timer(0.09),"timeout")
		
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene("res://menu/menu.tscn") # Mudar cena para o menu
