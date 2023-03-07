extends Node

var camera_shake_intensidade = 0.0
var camera_shake_duracao = 0.0

var som_shake : OpenSimplexNoise

func _ready():
	# Gera som pro shake
	som_shake = OpenSimplexNoise.new()
	som_shake.seed = randi()
	som_shake.octaves = 4
	som_shake.period = 20
	som_shake.persistence = 0.8

func shake(intensidade, duracao):
	# Gera parametros do shake
	if intensidade > camera_shake_intensidade and duracao > camera_shake_duracao:
		camera_shake_intensidade = intensidade
		camera_shake_duracao = duracao

func shake_para():
	# Get the camera (inútil, mas se não tiver, não funciona)
	var camera = get_tree().current_scene.get_node("Camera2D")
	
	# Stop shaking
	while camera_shake_duracao > 0:
		camera_shake_duracao = 0
		yield(get_tree().create_timer(1), "timeout")
		if camera_shake_duracao <= 0:
			# Reset the camera when the shaking is done
			camera.offset = Vector2.ZERO
			camera_shake_intensidade = 0.0
			camera_shake_duracao = 0.0
			return
	
	# Shake it
	var offset = Vector2.ZERO
	
	var som_shake_value_x = som_shake.get_noise_1d(OS.get_ticks_msec() * 0.1)
	var som_shake_value_y = som_shake.get_noise_1d(OS.get_ticks_msec() * 0.1 + 100.0)
	offset = Vector2(som_shake_value_x, som_shake_value_y) * camera_shake_intensidade * 2.0
		
	camera.offset = offset

func _process(delta):
	shake_para()
	camera_shake_duracao = camera_shake_duracao - delta
