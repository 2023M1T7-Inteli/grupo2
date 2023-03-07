extends Node2D

var pontos = 0
var pontosFase = 2

func movimento_setas(d):
	if d["valor"] == "direita":
		$jogador.move_local_x(75)
	elif d["valor"] == "esquerda":
		$jogador.move_local_x(-75)
		
		global.ordemCartas.pop_front() # Apaga comando já realizado. Sempre executa o primeiro item.
		yield(get_tree().create_timer(0.4), "timeout") # Pausa entre comandos.

func verifica_conta():
	if global.inimigoIf["valorAtaque"] + global.valorReal == 0:
		global.ordemCartas.pop_front()
		pontos += 1

func verifica_logica():
	if global.inimigoIf["tipo"] == global.se["tipo"]:
		pontos +=1
		print("pode atacar")

func ver_qual_funcao_sera_usada():
	for i in len(global.ordemCartas):
		if global.tipoCartas[i] == "setaD":
			movimento_setas(global.setaD)
		elif global.tipoCartas[i] == "setaE":
			movimento_setas(global.setaE)
		elif global.tipoCartas[i] == "numero":
			verifica_conta()
		elif global.tipoCartas[i] == "se":
			verifica_logica()

func _on_botao_pronto_pressed():
	ver_qual_funcao_sera_usada()
	if pontos == pontosFase:
		get_node("mensagem_vitoria/mensagem").set_text("Parabéns!!! Você conseguiu!")
		get_node("mensagem_vitoria").show()
		print("Venceu!")
	else:
		get_node("mensagem_vitoria/mensagem").set_text("Tente novamente")
		get_node("mensagem_vitoria").show()
		print("Perdeu!")

func _ready():
	# Esconde a tela de vitória (ou derrota) ao iniciar o jogo
	get_node("mensagem_vitoria").hide()
