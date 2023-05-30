extends Label

func _process(_delta):
	if global.estagio == 5:
		set_text("estágio: 1/5")
	elif global.estagio == 4:
		set_text("estágio: 2/5")
	elif global.estagio == 3:
		set_text("estágio: 3/5")
	elif global.estagio == 2:
		set_text("estágio: 4/5")
	elif global.estagio == 1:
		set_text("estágio: 5/5")
	
	if global.nivelLume == true:
		if global.estagio == 6:
			set_text("estágio: 1/6")
		elif global.estagio == 5:
			set_text("estágio: 2/6")
		elif global.estagio == 4:
			set_text("estágio: 3/6")
		elif global.estagio == 3:
			set_text("estágio: 4/6")
		elif global.estagio == 2:
			set_text("estágio: 5/6")
		elif global.estagio == 1:
			set_text("estágio: 6/6")
