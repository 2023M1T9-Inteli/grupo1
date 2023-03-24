extends Node2D

# Define as variáveis para os nós da cena que serão utilizados / Sets variables for used nodes.
onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")
onready var positionAndre = get_node("Personagens/fase2_andre")
onready var icon_table_area2d = get_node("cenario/icone_mesa/Area2D")

var cabou = false
# Configurações que são executadas logo quando a cena é iniciada / Configs executed as soon as scene starts.
func _ready():
	# Caixa de texto não está visível ao iniciar cena / Dialog Box notvisible when scene starts.
	$dialogo_1.visible = false 
	
	
	
	# variáveis fase 2 - animação / Phase 2 variables - dialog
	Global.npc_thomas_active = false
	Global.show_dialog3 = false
	
# Executa a cada quadro renderizado / Runs each frame
func _process(delta):
	if Global.final_dialogo1_fase2 == true:
		$quest_decision.visible = true


		# Se o personagem chegar na posição da cadeira, caixa de texto aparecerá iniciando o diálogo / When character reaches seat position, dialog box now visible and conversation starts.
	if positionRafa.position.x >= 450 && positionRafa.position.y <= 130:
		# Caixa de texto se torna visível / Dialog box now visible.
		Global.show_dialog3 = true 
		Global.npc_thomas_active == true
		Global.bloquear_movimentos()
	elif positionRafa.position.x >= 450 && positionRafa.position.y <= 130 && Global.show_dialog3 == false:
		$Personagens/fase2_andre.move_local_x(1)
	else:
		Global.show_dialog3 = false
		
	
	if Global.decisao1 == true:
		$quest_work.visible = true
		Global.decisao1 = false
	
	if Global.show_dialog3 == true:
		$dialogo_1.visible = true
	
	if Global.show_desicion == true:
		$quest_decision.visible = true
		Global.show_desicion = false
		
	if positionRafa.position.x <= 513 && positionRafa.position.y >= 120 && Global.show_dialog3 == true:
		$botTutoriais/textTutorial.text = " "
		
# Define as variáveis para os nós da cena que serão utilizados / Sets variables for used nodes.
onready var rafaposition = get_node("Personagens/fase1_rafa_protagonista")
onready var andreposition = get_node("Personagens/fase2_andre")
onready var dialogo1 = get_node("dialogo_1/Dialog1")
#
#func fimdialogo():
#		if Global.final_dialogo1_fase2 == true:
#			$quest_decision.visible = true
			
# Se a pessoa clicar na opção certa o usuário será levado para tela de feedback / When player presses correct answers, feedback is displayed.
func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true
	Global.final_dialogo1_fase2 = false


# Botão "incorreto pressionado". / Wrong button pressed.
func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true
	Global.final_dialogo1_fase2 = false


#Botão de retorno a fase pressionado. / Return button pressed.
func _on_back_phase_pressed():
	get_tree().reload_current_scene()
	Global.final_dialogo1_fase2 = false


# Botão de retorno a decisão pressionado. / Return button pressed.
func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false
	Global.final_dialogo1_fase2 = false

	
# Texto com link conectado que leva para o conteúdo / Text with a connected link that takes to the content
func _on_LinkButton_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=BtahWGGipqg")

#resposta incorreta selecionada / icorrect answer
func _on_wrong2_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true
	Global.final_dialogo1_fase2 = false


#bot de proxima fase pressionado / next level button
func _on_next_phase_pressed():
	get_tree().change_scene("res://cenas/fase3_cenas/explicação3.tscn")


func _on_LinkButton2_pressed():
	pass # Replace with function body.
