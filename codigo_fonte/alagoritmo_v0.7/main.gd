extends Node2D

func _ready():
	
	# Esconde a animação dos ataques do personagem
	get_node("cartas/carta_mais_dois/ataque_mais_dois").hide()
	get_node("cartas/carta_mais_dois2/ataque_mais_dois2").hide()
	get_node("cartas/carta_mais_dois3/ataque_mais_dois3").hide()
	
	# Esconde a label com mensagem de vitória da tela ao iniciar o jogo
	get_node("venceu").hide()

func _on_botao_pronto_pressed():
	
	# Mostra a animação dos ataques do personagem
	get_node("cartas/carta_mais_dois/ataque_mais_dois").show()
	get_node("cartas/carta_mais_dois2/ataque_mais_dois2").show()
	get_node("cartas/carta_mais_dois3/ataque_mais_dois3").show()
	
	# Começa a animação dos ataques do personagem
	get_node("cartas/carta_mais_dois/ataque_mais_dois").play("ataque_carta_mais_dois")
	get_node("cartas/carta_mais_dois2/ataque_mais_dois2").play("ataque_carta_mais_dois")
	get_node("cartas/carta_mais_dois3/ataque_mais_dois3").play("ataque_carta_mais_dois")
	
	# Verifica se a operação realizada resolve o padrão do inimigo
	if global.valorAtaqueInimigo + global.valorCartaMaisDoisReal == 0:
		# Se o jogador resolver roda uma animação de "morte" do inimigo e a label é revelada
		get_node("inimigo").play("anim_inimigo_morte")
		get_node("venceu").show() 
	else:
		# Mensagem que o jogador perdeu caso o padrão não seja resolvido
		get_node("venceu").set_text("Tente novamente")
		get_node("venceu").show()
