extends Node2D

func _on_TextureButton_pressed():
		# Se o botão com a palavra "informações" for pressionado, o jogo voltará para a tela do menu principal
	global.mudaCena = get_tree().change_scene("res://menu/menu.tscn")


func _ready():
	# Coloque essa função no _ready para ter certeza que o áudio está pronto para ser manipulado
	pass

#Abaixo segue caso o slider seja movido, o valor da música e dos sons deverá mudar. Creio que essa será a melhor e forma mais simples de alterar os sons do jogo

"""func _on_Slider_volume_value_changed(value):
	if:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
		AudioServer.set_bus_volume_db(0, value1)


func _on_Slider_musica_value_changed(value):
	pass # Replace with function body."""


#Segue abaixo uma outra forma de mudar o volume da música e sons (Não sei se será útil). Somente tirar as três aspas no início do bloco

""" 
# Define a variável global que armazenará o volume do jogo
var volume = 1.0
func _input(event):
	 Verifique se o jogador pressionou o botão de volume +
	if event.is_action_pressed("ui_up"):
		 Aumente o volume em 0,1 até um máximo de 1.0
		volume = min(volume + 0.1, 1.0)
		 #Ajuste o volume do áudio global
		AudioServer.set_bus_volume_db(0, volume_to_db(volume))
	 #Verifique se o jogador pressionou o botão de volume -
	elif event.is_action_pressed("ui_down"):
		# Diminua o volume em 0,1 até um mínimo de 0.0
		volume = max(volume - 0.1, 0.0)
		# Ajuste o volume do áudio global
		AudioServer.set_bus_volume_db(0, volume_to_db(volume))
Para usar esse código, você precisará configurar as entradas de ação do teclado no Godot. 
Para fazer isso, vá em "Project > Project Settings > Input Map" e adicione as seguintes entradas:
"ui_up" - defina isso como a tecla que você deseja usar para aumentar o volume
"ui_down" - defina isso como a tecla que você deseja usar para diminuir o volume
Isso deve permitir que você controle o volume do jogo pressionando as teclas configuradas. 
Lembre-se de que você pode ajustar os valores de aumento e diminuição do volume, bem como o volume máximo e mínimo, para atender às suas necessidades específicas
"""


func _on_Slider_volume_value_changed(value):
	# Define o volume do seu jogo para o valor atual do controle deslizante
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
