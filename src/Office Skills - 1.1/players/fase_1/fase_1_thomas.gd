extends KinematicBody2D

# "speed" é a velocidade do personagem, e speedauto é a velocidade da animação do personagem / "Speed" is the character speed and "speedauto" is the speed of the character automovement.
var speedAutoThomas = 120

# Velocity é uma variável que armazena a velocidade atual do objeto na direção x. / Velocity is the actual velocity of the object on direction x." é uma variável que armazena a velocidade atual do objeto na direção x 
var velocityThomas = Vector2()

# Etapa atual do movimento / Movement current step.
var stepThomas = 0

# Referência ao AnimationPlayer / AnimationPlayer Reference
var animation_playerThomas = null 

# Chamar animação. / Call animation.
func _ready():
	animation_playerThomas = get_node("anim")
	if not animation_playerThomas:
		print("AnimationPlayer não encontrado")

#Função para a movimentação do personagem. / Character movement function.
func _physics_process(delta):
	_set_animation()
	if Global.npc_thomas_active == true:
		stepThomas = 1
		Global.npc_thomas_active = false
		
	# Calcular a direção do movimento baseada no passo("step") atual. / Calculates direction based on current step.
	var direction = Vector2()
	
	if stepThomas == 1:
		direction = Vector2(213 - position.x, 0)
		if abs(direction.x) < speedAutoThomas * delta:
			direction.x = 213
			stepThomas = 2
			
	if stepThomas == 2:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speedAutoThomas * delta:
			position.y = 302 # Parar no y = 302
			stepThomas = 3

	if stepThomas == 3:
		direction = Vector2(286 - position.x, 0)
		if abs(direction.x) < speedAutoThomas * delta:
			position.x = 286 # Parar no x = 214
			stepThomas = 4
	
	if stepThomas == 4:
		direction = Vector2(0, 260 - position.y)
		if abs(direction.y) < speedAutoThomas * delta:
			position.y = 260 # Parar no x = 214
			Global.show_dialog3 = true
			stepThomas = 5
			
	if stepThomas == 5 && Global.show_dialog3 == false:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speedAutoThomas * delta:
			position.y = 302 # Parar no x = 214
			Global.show_dialog3 = true
			stepThomas = 6
	
	if stepThomas == 6:
		direction = Vector2(213 - position.x, 0)
		if abs(direction.x) < speedAutoThomas * delta:
			position.x = 213 # Parar no x = 214
			stepThomas = 7
	
	if stepThomas == 7:
		direction = Vector2(0, 150 - position.y)
		if abs(direction.y) < speedAutoThomas * delta:
			position.y = 150 # Parar no x = 214
			stepThomas = 8
	
	if stepThomas == 8:
		direction = Vector2(655 - position.x, 0)
		if abs(direction.x) < speedAutoThomas * delta:
			position.x = 655 # Parar no x = 214
			Global.show_desicion = true
			stepThomas = 0

	# Normalizar a direção para obter a velocidade / Normalize direction to obtain speed
	velocityThomas = direction.normalized() * speedAutoThomas

	# Executar o movimento com move_and_slide / Runs movement with move_and_slide.
	move_and_slide(velocityThomas, Vector2(0, -1))


func _set_animation():
	var anim = "idle"
	
	#Ativar devidas animações durante movimentação do personagem. / Activates correct animation during character movement.
	if velocityThomas.x > 0: 
		anim = "andandoladod"
	elif velocityThomas.x < 0: 
		anim = "andandoladoe"
	elif velocityThomas.y < 0:
		anim = "andandocima"
	elif velocityThomas.y > 0:
		anim = "andandobaixo"
	else:
		anim = "idle"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
