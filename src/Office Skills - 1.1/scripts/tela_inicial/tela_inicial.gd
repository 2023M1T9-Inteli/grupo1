extends Node2D

# Referência ao AnimationPlayer / AnimationPlayer Reference
var animation_playerRafa = null

func _ready(): 
	#iniciar sem rodar a função _process para rafa ficar parada. / Inicialize without running _process function so Rafa stays idle
	set_process(false) 

# ativar timer e ativar o _process(rafa andar) / Activate timer and activate _process (Rafa walks)
func _on_botao_enter_pressed():
	$btn_fases.visible = false
	$botsobre.visible = false
	$botcontroles.visible = false
	
	$Timer.start() 
	#comecar process / inicialize process
	set_process(true)
	$AudioStreamPlayer.play()

# loop para movimentação da rafa / Rafa movement loop
func _process(delta):
	#movimentar Rafa / Move Rafa
	var speedRafa = -140
	$RafaProtagonista.position.x += speedRafa * delta

	if position.x != 1:
		$RafaProtagonista/AnimationPlayer.play("andarembora")
		
		#parar assim que sair da tela / Stops as soon ascharacter leaves the screen
	if  position.x < 0:
		speedRafa = 0

# trocar de tela ao clicar "enter" no teclado / Change screen when  "enter" is pressed"
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ENTER:
			if event.pressed:
				_on_botao_enter_pressed()
				$AudioStreamPlayer.play()

# função timer / Timer function
func _on_Timer_timeout(): 
	#quando timer finalizar executar função (trocar para proxima tela) / On timeout run function and change to next screen
	get_tree().change_scene("res://cenas/fase1_cenas/cena_1.tscn")
	
#bot para abrir tela de fases / level screen button
func _on_btn_fases_pressed():
#	$exemplo_button_sobre.visible = true
	$fasestela.visible = true
	$botsaudio.play()

#bot para abrir tela de controles / control screen button
func _on_botcontroles_pressed():
	$exemplo_button_sobre.visible = true
	$botsair.visible = true
	$controlestela.visible = true
	$btn_fases.visible = false
	$botsobre.visible = false
	$botcontroles.visible = false
	$botsaudio.play()

#bot para abrir tela "sobre nós" / about screen button
func _on_botsobre_pressed():
	$exemplo_button_sobre.visible = true
	$botsair.visible = true
	$sobrenos.visible = true
	$botsaudio.play()
	
#bot para fechar telas no menu / exit button on menu screen
func _on_botsair_pressed():
	$exemplo_button_sobre.visible = false
	$botsair.visible = false 
	$controlestela.visible = false
	$btn_fases.visible = true
	$botsobre.visible = true
	$botcontroles.visible = true
	$sobrenos.visible  = false
	$botsaudio.play()

#sair tela de fases / exit level screen
func _on_sairfases_pressed():
	$fasestela.visible = false

#bot para abrir tutorial na tela de fases / tutorial level button on levels screen
func _on_tutorial_bot_pressed():
	get_tree().change_scene("res://cenas/fase1_cenas/cena_1.tscn")
	$botsaudio.play()

#bot para abrir fase 1 na tela de fases / level 1 button on levels screen	
func _on_fase1_bot_pressed():
	get_tree().change_scene("res://cenas/fase1_cenas/explicação1.tscn")
	$botsaudio.play()
	
#bot para abrir fase 2 na tela de fases / level 2 button on levels screen	
func _on_fase2_bot_pressed():
	get_tree().change_scene("res://cenas/fase2_cenas/explicação2.tscn")
	$botsaudio.play()

#bot para abrir fase 3 na tela de fases / level 3 button on levels screen	
func _on_fase3_bot_pressed():
	get_tree().change_scene("res://cenas/fase3_cenas/explicação3.tscn")
	$botsaudio.play()
	
#bot para abrir fase 4 na tela de fases / level 4 button on levels screen		
func _on_fase4_bot_pressed():
	get_tree().change_scene("res://cenas/fase4_cenas/explicação4.tscn")
	$botsaudio.play()

#bot para abrir fase 5 na tela de fases / level 5 button on levels screen		
func _on_fase5_bot_pressed():
	get_tree().change_scene("res://cenas/fase5_cenas/explicação5.tscn")
	$botsaudio.play()
