extends StaticBody2D

var estado = 0

func _process(_delta):
	if estado == 0:
		move_local_y(0.15)
		yield(get_tree().create_timer(1), "timeout")
		estado = 1
	elif estado == 1:
		move_local_y(-0.15)
		yield(get_tree().create_timer(1), "timeout")
		estado = 2
	elif estado == 2:
		move_local_x(0.10)
		yield(get_tree().create_timer(1), "timeout")
		estado = 3
	elif estado == 3:
		move_local_x(-0.10)
		yield(get_tree().create_timer(1), "timeout")
		estado = 4
	elif estado == 4:
		move_local_x(0.10)
		move_local_y(0.10)
		yield(get_tree().create_timer(1), "timeout")
		estado = 5
	elif estado == 5:
		move_local_x(-0.10)
		move_local_y(-0.10)
		yield(get_tree().create_timer(1), "timeout")
		estado = 0
