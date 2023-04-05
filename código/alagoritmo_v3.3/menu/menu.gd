extends Control

onready var transicao = get_node("transicao/preenchimento")
onready var animacao = get_node("transicao/preenchimento/animacao")
export(int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertical", "Corte Horizontal") var tipo_transicao
export(float, 2.0) var duracao = 1.0

func _ready():
	# O node de transição recebe o tipo e duração declarados nas variáveis
	transicao.material.set_shader_param("type", tipo_transicao )
	animacao.playback_speed = duracao
	
	# Ao terminar a transição, exclui a colisão para possibilitar clique no restante do HUD
	yield(get_tree().create_timer(duracao),"timeout")
	transicao.queue_free()

func _on_play_pressed():
	# Vai para a seleção de níveis
	global.mudaCena = get_tree().change_scene("res://menu/selecao_nivel.tscn")

func _on_info_pressed():
	# Se o botão com o símbolo de "i" for pressionado, o jogo mostrará a tela de informações
	global.mudaCena = get_tree().change_scene("res://menu/informacoes/Tela_informacoes.tscn")

func _on_config_pressed():
	# Se o botão com o símbolo de engrenagem for pressionado, o jogo mostrará a tela de configurações
	global.mudaCena = get_tree().change_scene("res://menu/configs/Tela_config.tscn")
