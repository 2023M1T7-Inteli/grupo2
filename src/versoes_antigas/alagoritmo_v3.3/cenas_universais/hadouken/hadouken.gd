extends Area2D

onready var dash = preload("res://cenas_universais/Dash/dash.gd")
onready var jogador = preload("res://cenas_universais/jogador.tscn")
onready var mensagem_derrota = preload("res://cenas_universais/mensagem_derrota.tscn")

var velocidade = 200

func _physics_process(delta):
	move_local_x(velocidade * delta)

func _on_Area2D_body_entered(body):
	if str(body).find("jogador") >= 0:
		global.vidaJogador -= 1
	queue_free()
