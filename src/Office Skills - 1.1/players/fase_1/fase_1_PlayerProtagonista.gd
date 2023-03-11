extends KinematicBody2D

# "speed" é a velocidade do personagem, e speedauto é a velocidade da animação do personagem / "Speed" is the character speed and "speedauto" is the speed of the character automovement.
var speedAutoRafa = 50

# "speed" é uma variável inteira que armazena a velocidade do player em pixels por segundo / "speed" is an integer variables of the player speed in pixels  per second.
var speedRafa = 100

# Velocity é uma variável que armazena a velocidade atual do objeto na direção x. / Velocity is the actual velocity of the object on direction x.
var velocityRafa = Vector2()

# Posição alvo final do NPC / NPC target position
var target_positionRafa = Vector2(136, 177) 

# Etapa atual do movimento / Movement current step.
var stepRafa = 1

# Referência ao AnimationPlayer / AnimationPlayer Reference
var animation_playerRafa = null 

# Utilizada para falar que ele chegou na eli e ativar a animação / Used to say characher reached Eli and activates animation.
var arrivedRafa = false 

# Utilizada para falar que a partir do momento em que alguma seta for clicada o idle volta a ser olhando para baixo. / As soon as a key is pressed idle is set to looking down.
var changeRafa = false 

#Desbloquea movimentos do jogador. / Unlocks player movements.
func _ready():
	Global.desbloquear_movimentos()
	animation_playerRafa = get_node("anim")
	if not animation_playerRafa:
		print("AnimationPlayer não encontrado")

# "_physics_process" é uma função responsável por atualizar a movimentação do personagem / "_physics_process" is the function responsible to update character movement.
func _physics_process(delta):
	_update_movement()
	_set_animation()
	
	# Calcular a direção do movimento / Calculate ovement direction.
	var direction = Vector2()
	if stepRafa == 1:
		direction = Vector2(target_positionRafa.x - position.x, 0)
		if abs(direction.x) < speedAutoRafa * delta:
			stepRafa = 2
			direction.x = 0
			arrivedRafa = true
			
	# Normalizar a direção para obter a velocidade / Normalize direction to obtain speed.
	velocityRafa = direction.normalized() * speedAutoRafa

	# Executar o movimento com move_and_slide / Execute movement with moce_and_slide.
	move_and_slide(velocityRafa, Vector2(0, -1))

#Movimentar personagem para as quatro direções após a animação.	/ Move character to all 4 directions after animation.
func _update_movement():
	velocityRafa.x = 0
	if not Global.bloqueio:
		#moverdireita / moveright
		if Input.is_action_pressed("move_right") and arrivedRafa == true: 
			velocityRafa.x += speedRafa
			changeRafa = true
		
		#moveresquerda / moveleft
		if Input.is_action_pressed("move_left") and arrivedRafa == true: 
			velocityRafa.x -= speedRafa
			changeRafa = true
		
		#movercima / moveup
		if Input.is_action_pressed("ui_up") and arrivedRafa == true: 
			velocityRafa.y -= speedRafa
			changeRafa = true 
		
		#moverbaixo / movedown
		if Input.is_action_pressed("ui_down") and arrivedRafa == true: 
			velocityRafa.y += speedRafa
			changeRafa = true 
  
	velocityRafa = move_and_slide(velocityRafa, Vector2(0, -1))

# set_animationpermite é uma função para controlar as animações. / set_animationpermite is a function to control animations. 
func _set_animation():
	
	#Variável de animação. / Animation variable 
	var anim = "idle"
	
	#Quando personagem chegar na eli animação de olhar para cima. / When player reaches Eli, look up animation.
	if position.x >= 260: 
		anim = "idlecima"
	else:
		anim = "idle"
	
	#Ativar devidas animações durante movimentação do personagem. / Activates correct animation during character movement.
	if velocityRafa.x > 0: 
		anim = "andandoladod"
	elif velocityRafa.x < 0: 
		anim = "andandoladoe"
	elif velocityRafa.y < 0:
		anim = "andandocima"
	elif velocityRafa.y > 0:
		anim = "andandobaixo"
	
	#Ativar movimentação durante movimento automático no inicio da fase. / Acvtivates movement during auto move when level starts.
	if stepRafa == 1:
		anim = "andandoladod"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)

