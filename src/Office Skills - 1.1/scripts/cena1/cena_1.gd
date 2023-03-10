extends Node2D

# Referência ao AnimationPlayer/ AnimationPlayer reference
var animation_playerRafa = null 

# ao clicar os botões aparecer o tutorial do mesmo e ativar animação na imagem. / Activate tutorial and animations when pressing movement keys.
func _process(delta): 
	if Input.is_action_just_pressed("pressed_enter"):
		animation_playerRafa = get_node("botTutorials/botenter/enterAnim")
		animation_playerRafa.play("pressionando")
		$botTutorials/text_tutorial.text = "Utilize este botão para confirmar e pular as falas"
	if Input.is_action_just_pressed("move_right"):
		animation_playerRafa = get_node("botTutorials/botdireita/enterAnim")
		animation_playerRafa.play("pressionando")
		$botTutorials/text_tutorial.text = "Utilize este botão para mover-se para direita."
	if Input.is_action_just_pressed("move_left"):
		animation_playerRafa = get_node("botTutorials/botesquerda/enterAnim")
		animation_playerRafa.play("pressionando")
		$botTutorials/text_tutorial.text = "Utilize este botão para mover-se para esquerda."
	if Input.is_action_just_pressed("press_tab"):
		animation_playerRafa = get_node("botTutorials/bottab/enterAnim")
		animation_playerRafa.play("pressionando")
		$botTutorials/text_tutorial.text = "Utilize este botão para abrir as configurações do jogo."
		
	
# func que controla a caixa de dialogo para aparecer apenas quando o jogador alcancar a posição da eli / Activates dialog box when player reaches Eli.
func _physics_process(delta): 
	$dialogo.visible = false 
	if $protagonistaPlayer.position.x >= 360: 
		$dialogo.visible = true 
	
	# trocar para fase 1 / changes to phase 1
	if $protagonistaPlayer.position.x >= 640: 
		get_tree().change_scene("res://cenas/explicação1.tscn")
