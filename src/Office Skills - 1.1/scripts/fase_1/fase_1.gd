extends Node2D

# Define as variáveis para os nós da cena que serão utilizados / Sets variables for used nodes.
onready var positionRafa = get_node("Personagens/fase1_rafa_protagonista")
onready var icon_table_area2d = get_node("cenario/icone_mesa/Area2D")

# Configurações que são executadas logo quando a cena é iniciada / Configs executed as soon as scene starts.
func _ready():
	# Caixa de texto não está visível ao iniciar cena / Dialog Box notvisible when scene starts.
	$dialogo_1.visible = false 
	icon_table_area2d.monitoring = false
	
	# variáveis fase 1 - dialogo / Phase 1 variables - dialog
	Global.final_dialogo = false

	# variáveis fase 1 - animação / Phase 1 variables - animation
	Global.step2_eli = false
	Global.step3_eli = false
	Global.npc_thomas_active = false

	# variáveis fase 1 - animação / Phase 1 variables - dialog
	Global.final_dialogo = false
	Global.final_dialog2 = false
	Global.dialogo3_thomas = false
	Global.show_dialog3 = false
	
# Executa a cada quadro renderizado / Runs each frame
func _process(delta):
	if Global.final_dialogo == false:
		# Se o personagem chegar na posição da cadeira, caixa de texto aparecerá iniciando o diálogo / When character reaches seat position, dialog box now visible and conversation starts.
		if positionRafa.position.x >= 260 && positionRafa.position.y <= 280:
			# Caixa de texto se torna visível / Dialog box now visible.
			$dialogo_1.visible = true 
		else:
			$dialogo_1.visible = false	
	
	if Global.final_dialogo == true:
		$cenario/icone_mesa.visible = true
		icon_table_area2d.monitoring = true
		Global.final_dialogo = false
	
	if 	Global.final_dialog2 == true:
		$objects_cenario/papel_trabalho1.visible = true
		$dialogo_2.visible = false
		Global.step3_eli = true
		Global.final_dialog2 = false
	
	if Global.decisao1 == true:
		$quest_work.visible = true
		$Personagens/eli_Rh_player.visible = false
		Global.decisao1 = false
	
	if Global.show_dialog3 == true:
		$dialogo_3.visible = true
	
	if Global.show_desicion == true:
		$quest_decision.visible = true
		Global.show_desicion = false
		
	if positionRafa.position.x >= 260 && positionRafa.position.y <= 280:
		$textTutorial2.text = str(" ")
	
# Define as variáveis para os nós da cena que serão utilizados / Sets variables for used nodes.
onready var rafaposition = get_node("Personagens/fase1_rafa_protagonista")
onready var icone_mesa = get_node("cenario/icone_mesa")
onready var dialogo1 = get_node("dialogo_1/Dialog1")

# Chamada quando um corpo entra na Área2D / Runs when body enters 2D Area.
func _on_Area2D_body_entered(body):
	# Define a visibilidade de objetos específicos da cena / Sets especific object visibility on scene.
	$objects_cenario/CenarioFase1Objects.visible = true
	Global.bloquear_movimentos()
	rafaposition.position.x = 367
	rafaposition.position.y = 266
	Global.step2_eli = true
	$dialogo_2.visible = true

# Quando a pessoa clicar em "trabalhar" o Thomas aparecerá / When player presses "trabalhar" Thomas comes in scene.
func _on_button_quiz_pressed():
	$quest_work.visible = false
	$objects_cenario/papel_trabalho1.visible = false
	$objects_cenario/papel_trabalho2.visible = true
	Global.npc_thomas_active = true
	Global.dialogo3_thomas = true

# Se a pessoa clicar na opção certa o usuário será levado para tela de feedback / When player presses correct answers, feedback is displayed.
func _on_right_pressed():
	$quest_decision.visible = false
	$right_decision.visible = true

# Botão "incorreto pressionado". / Wrong button pressed.
func _on_wrong_pressed():
	$quest_decision.visible = false
	$wrong_decision.visible = true

#Botão de proxima fase pressionado. [WIP] / Next level button [WIP]
func _on_next_phase_pressed():
	get_tree().change_scene("res://cenas/explicação2.tscn")

#Botão de retorno a fase pressionado. / Return button pressed.
func _on_back_phase_pressed():
	get_tree().reload_current_scene()

#Botão de retorno a decisão pressionado. / Return button pressed.
func _on_back_decision_pressed():
	$quest_decision.visible = true
	$wrong_decision.visible = false

# Texto com link conectado que leva para o conteúdo / Text with a connected link that takes to the content
func _on_LinkButton_pressed():
	OS.shell_open("https://youtu.be/htZ0jU5tVWQ")
