extends Area2D

var velocidade = 300

func _physics_process(delta):
	move_local_y(velocidade * delta)

func _on_Area2D_body_entered(body):
	if str(body).find("jogador") >= 0:
		global.vidaJogador -= 1
	self.queue_free()
