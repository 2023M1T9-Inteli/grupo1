extends Node2D


onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	#quando acabar o dialogo aparecer a tela de decisão / when dialog finished show decision screen
	if Global.final_dialogo1_fase3 == true:
		$quest_decision.visible = true
		$"missão".visible = false
		
#resposta incorreta selecionada / incorrect answer selected
func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true
	Global.final_dialogo1_fase3 = false
	$botsaudio.play()

#resposta correta selecionada / correct answer selected
func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true
	Global.final_dialogo1_fase3 = false
	$botsaudio.play()

#bot de proxima fase / next level button
func _on_next_phase_pressed():
	get_tree().change_scene("res://cenas/fase4_cenas/explicação4.tscn")
	$botsaudio.play()

#bot de rejogar fase  / replay level
func _on_back_phase_pressed():
	get_tree().reload_current_scene()
	Global.final_dialogo1_fase3 = false
	$botsaudio.play()

#botao de voltar decisão pressionado / back to decision button
func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false
	Global.final_dialogo1_fase3 = false
	$botsaudio.play()


#quando jogador entrar na area deternimanda, bloquear movimentos e aparecer ddialogos. / when player enterss selected area , block movements and show dialog
func _on_Area2D_body_entered(body):
	Global.bloquear_movimentos()
	$dialogo_1.visible = true
	$icone_mesa.visible = false
#	$personagens/fase1_rafa_protagonista.position.x = 412
#	$personagens/fase1_rafa_protagonista.position.y = -12
