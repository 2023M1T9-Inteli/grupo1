extends Node2D

onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")
onready var rafaposition = get_node("Personagens/fase1_rafa_protagonista")


# Called when the node enters the scene tree for the first time.
func _ready():
	$quest_decision.visible = false	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.final_dialogo1_fase4 == true:
		$quest_decision.visible = true
		$"missão".visible = false


#resposta incorreta / incorrect answer selected
func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true
	$botsaudio.play()

#resposta correta  / correct answer selected
func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true
	Global.final_dialogo1_fase4 = false
	$botsaudio.play()

#botao de rejogar fase / replay level button selected
func _on_back_phase_pressed():
	get_tree().reload_current_scene()
	Global.final_dialogo1_fase4 = false
	$botsaudio.play()

#botao dde voltar decisão / back to  decision btton.
func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false
	Global.final_dialogo1_fase4 = false
	$botsaudio.play()

#botao de proxima fase / next level button.
func _on_next_phase_pressed():
	get_tree().change_scene("res://cenas/fase5_cenas/explicação5.tscn")
	$botsaudio.play()

#quando jogador entrar na area realizar ações. / when player enters show dialog, and dialog.
func _on_Area2D_body_entered(body):
	Global.bloquear_movimentos()
	$dialogo_1.visible = true
	$icone_mesa.visible = false
	$dialogo_1.visible = true
	$personagens/fase1_rafa_protagonista.position.x = 583
	$personagens/fase1_rafa_protagonista.position.y = 217


