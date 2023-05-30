extends Area2D

var velocidade = 400

func _physics_process(delta):
	move_local_x(velocidade * delta)

func _on_Area2D_body_entered(body):
	if str(body).find("jogador") >= 0:
		pass
	else:
		global.levouDano = 1
		queue_free()
