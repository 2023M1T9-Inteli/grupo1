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
	
	#aparecer dialogo quando jogador chegar em determinada posição / show dialog when player reaches position
	if $protagonistaPlayer.position.x >= 360: 
		$dialogo.visible = true 
	
	# quando  movimentos bloqueados nao aparecer botões de tutorial / when  movements locked, don't show tutorial buttons.
	if Global.bloqueio:
		$botTutorials/botesquerda.visible = false
		$botTutorials/botdireita.visible = false
		$botTutorials/bottab.visible = false
	
	#se não estiver bloqueado mostrar tutoriais / if unlocked show button tutorials
	if not Global.bloqueio:
		$botTutorials/botesquerda.visible = true
		$botTutorials/botdireita.visible = true
		$botTutorials/bottab.visible = true
		$botTutorials/text_tutorial.visible = true
		
	# trocar para fase 1 / changes to phase 1
	if $protagonistaPlayer.position.x >= 640: 
		get_tree().change_scene("res://cenas//fase1_cenas/explicação1.tscn")
