extends Area2D

var velocidade = 800
var curvatura = 1

func _physics_process(delta):
	move_local_x(velocidade * delta)
	rotation_degrees = curvatura
	curvatura = curvatura + 6
	if curvatura > 359:
		curvatura = -360
	yield(get_tree().create_timer(0.90), "timeout")
	queue_free()

func _on_Area2D_body_entered(body):
	if str(body).find("jogador") >= 0:
		global.vidaJogador -= 1
	queue_free()
