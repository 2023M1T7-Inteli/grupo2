extends Area2D

func onHit(_damage):
#	var text = floating_text.instance()
#	text.get_child(0).text = String(damage)
##	text.type = cores[randi() % 3]
##	add_child(text)
#	print(text.text)
	pass


func _on_Button_pressed():
	onHit(6)
