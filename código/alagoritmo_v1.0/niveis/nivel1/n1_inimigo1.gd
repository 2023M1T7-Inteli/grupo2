extends AnimatedSprite

func _ready():
	# Animações de ataque do inimigo são rodadas ao início da cena
	$"ataque_inimigo_menos_dois".play("anim_ataque_inimigo")
	$"ataque_inimigo_menos_dois2".play("anim_ataque_inimigo")
	$"ataque_inimigo_menos_dois3".play("anim_ataque_inimigo")
