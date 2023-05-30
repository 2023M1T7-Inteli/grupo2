extends AudioStreamPlayer

func _ready():
	yield(get_tree().create_timer(1.5),"timeout")
	self.play()

#func _process(_delta):
#	pass
