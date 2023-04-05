extends Node2D

#Máquina de estado para iniciar cinemática
var movendo = false

#Exports para controlar tipo e duração das transições
onready var transicao = get_node("transição/preenchimento")
onready var animacao = get_node("transição/preenchimento/animacao")
export(int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertical", "Corte Horizontal") var tipo_transicao
export(float, 2.0) var duracao = 1.0

func _ready():
	#Inicia transição e libera a movimentação
	transicao.material.set_shader_param("type", tipo_transicao )
	animacao.playback_speed = duracao
	yield(get_tree().create_timer(1),"timeout")
	movendo = true
	
func aluado_pulo():
	#Pequeno salto que o sprite do personagem dá
	$jogador.move_and_slide(Vector2(0,-10))
	yield(get_tree().create_timer(0.3),"timeout")
	$jogador.move_and_slide(Vector2(0,10))
	yield(get_tree().create_timer(0.3),"timeout")
	$jogador.move_and_slide(Vector2.ZERO)
	
func _process(delta):
	# Se o cangaceiro estiver andando e o frame atual for os frames em que ele pisa no chão, a tela treme e o personagem dá um pulo pelo impacto 
	if $boss/boss.animation == "run" and $boss/boss.frame == 0 or $boss/boss.frame == 4:
		shake.shake(3, 1)
		aluado_pulo()
		$sons/som_pisada.play()
		yield(get_tree().create_timer(1),"timeout")
		$sons/som_pisada.stop()

	if movendo: 
		if $boss.position.x > 50: # Movimento do cangaceiro enquanto ele não chegou na posição final
			$boss/boss.play("run")
			$boss/boss.scale = Vector2(0.65,0.65)
			$boss.move_and_slide(Vector2(-50,0))
		else: # Cangaceiro para de se mover e cena muda para a batalha
			$boss/boss.play("idle")
			$boss/boss.scale = Vector2(2.5,2.5)
			$boss.move_and_slide(Vector2.ZERO)
			yield(get_tree().create_timer(1),"timeout")
		
			get_tree().change_scene("res://niveis/cordel1/bossC/bossCangaceiro.tscn")
