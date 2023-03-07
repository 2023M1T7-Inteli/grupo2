extends Node2D

func movimento_setas():
	while global.ordemCartas != []:
		if global.ordemCartas[0] == "direita":
			$jogador.move_local_x(75)
		elif global.ordemCartas[0] == "esquerda":
			$jogador.move_local_x(-75)
		
		global.ordemCartas.pop_front() # Apaga comando já realizado. Sempre executa o primeiro item.
		yield(get_tree().create_timer(0.4), "timeout") # Pausa entre comandos.

func _on_botao_pronto_pressed():
	movimento_setas()

func _ready():
	# Esconde a tela de vitória (ou derrota) ao iniciar o jogo
	get_node("mensagem_vitoria").hide()
