extends Node2D

var velocity = 400
var duracaoDash = 0.2
var dash_esquerda_possivel = true
var dash_direita_possivel = true
onready var dash = $dash
onready var sprite = $jogador/Sprite

func movimento_setas():
	mostrar_bordas()
	while global.ordemCartas != []:
		if global.ordemCartas[0] == "direita":
			mover_direita()
		elif global.ordemCartas[0] == "esquerda":
			mover_esquerda()
		global.ordemCartas.pop_front() # Apaga comando já realizado. Sempre executa o primeiro item.
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.


func mostrar_bordas():
	for i in len(global.ordemCartas):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()
		
func _on_botao_pronto_pressed():
	movimento_setas()

	# Esconde a tela de vitória (ou derrota) ao iniciar o jogo
	get_node("mensagem_vitoria").hide()
	get_node("mensagem_derrota").hide()

func mover_esquerda():
	if dash_esquerda_possivel:
		dash.start_dash(sprite, duracaoDash)
		$jogador.velocity = Vector2(-450,0)
		yield(get_tree().create_timer(0.3), "timeout")
		$jogador.velocity = Vector2(0,0)


func mover_direita():
	if dash_direita_possivel:
		dash.start_dash(sprite, duracaoDash)
		$jogador.velocity = Vector2(450,0)
		yield(get_tree().create_timer(0.3), "timeout")
		$jogador.velocity = Vector2(0,0)


func _on_piso_esquerda_body_entered(body):
	if body == $jogador:
		dash_esquerda_possivel = false

func _on_piso_esquerda_body_exited(body):
	if body == $jogador:
		dash_esquerda_possivel = true



func _on_piso_direita_body_entered(body):
	if body == $jogador:
		dash_direita_possivel = false

func _on_piso_direita_body_exited(body):
	if body == $jogador:
		dash_direita_possivel = true
