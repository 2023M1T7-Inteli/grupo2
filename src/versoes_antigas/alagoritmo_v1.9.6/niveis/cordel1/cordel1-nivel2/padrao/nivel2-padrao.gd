extends Node2D

const dashDuracao = 0.2

onready var sprite = $jogador/Sprite
onready var dash = $Dash

func mostrar_bordas():
	for i in len(global.ordemCartas):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()
	
func _on_botao_pronto_pressed():
	mostrar_bordas()
	subirEspinhos()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
#	get_node("mensagens/mensagem_vitoria").hide()
	pass
 
	if global.posicaoJogador != null:
		$jogador.position = global.posicaoJogador
	
	if global.estagioSave == null:
		global.estagio = 5
	else:
		global.estagio = global.estagioSave
	
	global.vidaJogador = 1

var chegouNaSeta = false

func verifica_vitoria():
	if chegouNaSeta:
		get_node("mensagens/mensagem_vitoria").show()
	else:
		get_node("mensagens/mensagem_derrota").show()

func _on_piso_direita_body_entered(_body):
	chegouNaSeta = true


func _process(_delta):
	pass

func _on_botao_olho_pressed():
	global.posicaoJogador = $jogador.get_position()
	print(global.posicaoJogador)
	global.mudaCena = get_tree().change_scene("res://niveis/cordel1/cordel1-nivel2/padrao/nivel2-padrao.tscn")
	global.valorReal = 0
	
	
	##################################### ESPINHOS

func subirEspinhos():
	$pisos/piso_centro/espinhos.play("default")
	yield(get_tree().create_timer(0.7), "timeout")
	$pisos/piso_centro/espinhos.play("default", true)


var nosEspinhos = false
func _on_piso_centro_body_entered(_body):
	nosEspinhos = true

func _on_piso_centro_body_exited(_body):
	nosEspinhos = false
