extends Node2D

var botaoPressionado = false
var opacidadeLogo = 1.0
var opacidadeInstrucao = 0.0


func _ready():
	yield(get_tree().create_timer(0.5),"timeout")
	$logo_alagoritmo.play("default") # Roda a animação da logo ao rodar os créditos
	yield(get_tree().create_timer(3),"timeout")
	aparecer_instrucao()
	
func _process(_delta):
	if $logo_alagoritmo.frame > 54: # Começa a descer a câmera após o frame 54
		if $Camera2D.position < Vector2(260, 1595):
			if botaoPressionado:
				$Camera2D.position -= Vector2(0, -3) # Desce o código acelerado
			else:
				$Camera2D.position -= Vector2(0, -0.5) # Desce o código em velocidade normal
		else: #Ao parar de descer a tela, deixa o logo invisível após algum tempo
			yield(get_tree().create_timer(1),"timeout")
			$All4OneLogo.modulate = Color(1,1,1,opacidadeLogo)
			opacidadeLogo -= 0.1
			yield(get_tree().create_timer(0.5),"timeout")
	
	if botaoPressionado == true and $logo_alagoritmo.frame > 54: #Apaga a instrução de clicar na tela após realizar o comando
		$Camera2D/Label.modulate = Color(1,1,1,opacidadeInstrucao)
		opacidadeInstrucao -= 0.1
			
	if $All4OneLogo.modulate.a < 0: #Após apagar o logo, aguarda 1 segundo e volta ao menu
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://menu/menu.tscn")
	
func aparecer_instrucao(): #Fade-in da instrução de clicar na tela
	while opacidadeInstrucao != 1:
		opacidadeInstrucao += 0.1
		$Camera2D/Label.modulate = Color(1,1,1,opacidadeInstrucao)
		yield(get_tree().create_timer(0.1),"timeout")
		
func _on_TextureButton_button_down(): #Controla o clique na tela para modular a velocidade
	botaoPressionado = true

func _on_TextureButton_button_up(): #Controla o clique na tela para modular a velocidade
	botaoPressionado = false
