extends Node2D

export (String, FILE, "*.tscn") var visualizarPadroes

func escondeAnimJogador():
	# Esconde a animação dos ataques do personagem
	get_node("cartas/carta1/ataque_mais_dois").hide()
	get_node("cartas/carta2/ataque_mais_dois2").hide()
	get_node("cartas/carta3/ataque_mais_dois3").hide()

func mostraAnimJogador():
	# Mostra a animação dos ataques do personagem
	get_node("cartas/carta1/ataque_mais_dois").show()
	get_node("cartas/carta2/ataque_mais_dois2").show()
	get_node("cartas/carta3/ataque_mais_dois3").show()
	
	# Começa a animação dos ataques do personagem
	get_node("cartas/carta1/ataque_mais_dois").play("ataque_carta_mais_dois")
	get_node("cartas/carta2/ataque_mais_dois2").play("ataque_carta_mais_dois")
	get_node("cartas/carta3/ataque_mais_dois3").play("ataque_carta_mais_dois")

func verificaVitoria():
	# Verifica se a operação realizada resolve o padrão do inimigo
	if global.valorAtaqueInimigo + global.valorReal == 0:
		# Se o jogador resolver roda uma animação de "morte" do inimigo e a label é revelada
		get_node("inimigo").play("anim_inimigo_morte")
#		get_node("mensagem_vitoria/mensagem").set_text("Parabéns!!! Você conseguiu!")
		get_node("mensagem_vitoria").show() 
	else:
		# Mensagem que o jogador perdeu caso o padrão não seja resolvido
		get_node("mensagem_derrota").show()

func _ready():
	# Esconde a tela de vitória (ou derrota) ao iniciar o jogo
	get_node("mensagem_derrota").hide()
	get_node("mensagem_vitoria").hide()
	escondeAnimJogador()
	
func mostrar_bordas():
	for i in range(3):
		i += 1
		get_node("fundo/borda_instrucao" + String(i)).show()
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
		get_node("fundo/borda_instrucao" + String(i)).hide()
		
func _on_botao_pronto_pressed():
	mostraAnimJogador()
	verificaVitoria()
	mostrar_bordas()


func _on_botao_ataques_pressed():
	global.mudaCena = get_tree().change_scene(visualizarPadroes)
	global.valorReal = 0
