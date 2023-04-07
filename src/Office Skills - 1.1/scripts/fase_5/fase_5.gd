extends Node2D

# Variáveis para checar se o botão está clicado
var clicando1 = false
var clicando2 = false
var clicando3 = false
var clicando4 = false
var clicando5 = false
var clicando6 = false

# Variável para o cartão acompanhar o mouse
var offsetMouse = Vector2()

# Variável para verificar se a pessoa completou o jogo
var completou = 0

# Váriaveis para verificar se o cartão está no local certo
var verificar1 = false
var verificar2 = false
var verificar3 = false
var verificar4 = false
var verificar5 = false
var verificar6 = false



# Função para o cartão acompanhar o mouse
func _process(delta):
	if clicando1 == true:
		$cartao1.position = get_global_mouse_position() - offsetMouse
		
	if clicando2 == true:
		$cartao2.position = get_global_mouse_position() - offsetMouse
		
	if clicando3 == true:
		$cartao3.position = get_global_mouse_position() - offsetMouse
	
	if completou == 3:
		$botfim.visible = true



# Função para definir o offset
func _on_card1_button_down():
	clicando1 = true
	offsetMouse = get_global_mouse_position() - $cartao1.position

# Função para verificar se o cartão está no área certa quando o botão for solto
func _on_card1_button_up():
	clicando1 = false
	if verificar1 == true:
		$card1.queue_free()
		completou +=1
	elif verificar1 == false:
		$cartao1.position = Vector2(100, 115)

# Funções para verificar se o cartão está na área certa
func _on_Area1_area_entered(area):
	if area == $cartao1:
		verificar1 = true

	if area != $cartao1:
		$Popuperrou1.show()
		
func _on_Area1_area_exited(area):
	if area == $cartao1:
		verificar1 = false

	if area != $cartao1:
		$Popuperrou1.hide()




# Função para definir o offset
func _on_card2_button_down():
	clicando2 = true
	offsetMouse = get_global_mouse_position() - $cartao2.position

# Função para verificar se o cartão está no área certa quando o botão for solto
func _on_card2_button_up():
	clicando2 = false
	if verificar2 == true:
		$card2.queue_free()
		completou +=1
	elif verificar2 == false:
		$cartao2.position = Vector2(0, 0)

# Funções para verificar se o cartão está na área certa
func _on_Area2_area_entered(area):
	if area == $cartao2:
		verificar2 = true
		
	if area != $cartao2:
		$Popuperrou2.show()

func _on_Area2_area_exited(area):
	if area == $cartao2:
		verificar2 = false

	if area != $cartao2:
		$Popuperrou2.hide()



# Função para definir o offset
func _on_card3_button_down():
	clicando3 = true
	offsetMouse = get_global_mouse_position() - $cartao3.position

# Função para verificar se o cartão está no área certa quando o botão for solto
func _on_card3_button_up():
	clicando3 = false
	if verificar3 == true:
		$card3.queue_free()
		completou +=1
	elif verificar3 == false:
		$cartao3.position = Vector2(0, 0)

# Funções para verificar se o cartão está na área certa
func _on_Area3_area_entered(area):
	if area == $cartao3:
		verificar3 = true
		
	if area != $cartao3:
		$Popuperrou3.show()

func _on_Area3_area_exited(area):
	if area == $cartao3:
		verificar3 = false

	if area != $cartao3:
		$Popuperrou3.hide()



#botão para tela final / final scene  button
func _on_TextureButton_pressed():
	get_tree().change_scene("res://cenas/final/telafinal.tscn")
