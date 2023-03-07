extends AnimatedSprite

var ataqueInstance
onready var ataque = preload("res://niveis/nivel1/padroes/ataque_inimigo.tscn")

func _on_Jogador_placeholder_body_entered(body):
	body.queue_free()

func _on_botao_pronto_pressed():
	var ataques = ["hit","pass","hit"]
	while ataques != []:
		if ataques[0] == "hit":
			ataqueInstance = ataque.instance()
			add_child(ataqueInstance)
		ataques.pop_front() # Apaga comando já realizado. Sempre executa o primeiro item.
		yield(get_tree().create_timer(0.7), "timeout") # Pausa entre comandos.
