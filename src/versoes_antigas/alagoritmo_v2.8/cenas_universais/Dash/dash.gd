extends Node2D

onready var timerDuracao = $TimerDuracao
onready var timerSombra = $TimerSombra
var cenaSombra = preload("res://cenas_universais/Dash/DashSombra.tscn")
var sprite

func comeca_dash(spr, duracao):
	self.sprite = spr
	spr.material.set_shader_param("mix_weight", 0.7)
	spr.material.set_shader_param("azul", true)
	timerDuracao.wait_time = duracao
	timerDuracao.start()
	timerSombra.start()
	instancia_sombra()

func instancia_sombra():
	var sombra: Sprite = cenaSombra.instance()
	get_parent().get_parent().add_child(sombra)
	
	sombra.global_position = sprite.global_position
	sombra.texture = sprite.texture
	sombra.scale = sprite.scale
	sombra.vframes = sprite.vframes
	sombra.hframes = sprite.hframes
	sombra.frame = sprite.frame
	sombra.flip_h = sprite.flip_h

func esta_dashando():
	return !timerDuracao.is_stopped()
	

func termina_dash():
	timerSombra.stop()
	sprite.material.set_shader_param("azul", false)

func _on_TimerSombra_timeout():
	instancia_sombra()


func _on_TimerDuracao_timeout():
	termina_dash()
