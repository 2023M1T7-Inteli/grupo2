extends Node

func _ready():
	var instrucoes = [$instrucao1, $instrucao2, $instrucao3]
	
	for i in len(global.guardaImagemInstrucoes):
		instrucoes[i].set_text(global.guardaImagemInstrucoes[i])
