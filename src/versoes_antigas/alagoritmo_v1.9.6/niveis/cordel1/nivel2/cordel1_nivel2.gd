extends Node2D

func verificaVitoria():
	# Verifica se a operação realizada resolve o padrão do inimigo
	if global.valorReal == 4:
		# Se o jogador resolver roda uma animação de "morte" do inimigo e a label é revelada
		get_node("mensagem_vitoria/mensagem").set_text("Parabéns!!! Você conseguiu!")
		get_node("mensagem_vitoria").show() 
	else:
		# Mensagem que o jogador perdeu caso o padrão não seja resolvido.
		get_node("mensagem_derrota").show()

func _ready():
	# Esconde a tela de vitória e derrota ao iniciar o jogo.
	get_node("mensagem_vitoria").hide()
	get_node("mensagem_derrota").hide()

func _on_botao_pronto_pressed():
	verificaVitoria()
