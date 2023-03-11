extends KinematicBody2D

 # Posição alvo final do NPC / NPC Target Postions
var target_positionEli = Vector2(400, 118)
var target_position2Eli = Vector2(685, 160)

# Step é a etapa atual da animação do movimento / Current animation step.
var stepEli = 1 

# Velocidade atual do NPC / NPC current velocity.
var velocityEli = Vector2() 

# Velocidade de movimento do NPC / NPC movement speed.
var speedEli = 50

# Referência ao AnimationPlayer / AnimationPlayer reference 
var animation_playerEli = null 

#Variavel para quando jogador alcança o destino / Variable for when pleayer reaches destination
var arrivedEli = false

func _ready():
	# Pegar o node da animação do personagem / Gets character animation node.
	animation_playerEli = get_node("anim")
	if not animation_playerEli:
		print("AnimationPlayer não encontrado")

func _process(delta):
	# Se o movimento da eli for acionado depois do dialogo, ela fará a 3 etapa da animação. / If Eli movement is triggered after dialog, activate animation step 3.
	if Global.movimento_2_eli == true:
		stepEli = 3 
	
func _physics_process(delta):
	# Calcular a direção do movimento / Calculate movement direction
	var direction = Vector2()
	
	print(position.x)
	print(position.y)
	# Etapas de animação/ Animation steps
	if stepEli == 1:
		direction = Vector2(target_positionEli.x - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			stepEli = 2
			direction.x = 0
	if stepEli == 2:
		direction = Vector2(0, target_positionEli.y - position.y)
		if abs(direction.y) < speedEli * delta:
			direction.y = 0
			velocityEli = Vector2()
			arrivedEli = true
	if stepEli == 3:
		direction = Vector2(0, target_position2Eli.y - position.y)
		if abs(direction.y) < speedEli * delta:
			if arrivedEli:
				stepEli = 4
				direction = Vector2(target_position2Eli.x - position.x, 0)
			else:
				stepEli = 4
				direction = Vector2(target_position2Eli.x - position.x, 0)
	if stepEli == 4:
		direction = Vector2(target_position2Eli.x - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			arrivedEli = true
			direction.x = 0

	# Normalizar a direção para obter a velocidade / Normalize direction to obtain speed.
	velocityEli = direction.normalized() * speedEli

	# Executar o movimento com move_and_slide / Execute movement with move_and_slide
	move_and_slide(velocityEli, Vector2(0, 0))
	
	# Definir a animação de acordo com a direção / Set the animation accordingly to the direction.
	if velocityEli.x > 0:
		animation_playerEli.play("andandoladod")
	elif velocityEli.x < 0:
		animation_playerEli.play("andandoladoe")
	elif velocityEli.y > 0:
		animation_playerEli.play("andandobaixo")
	elif velocityEli.y < 0:
		animation_playerEli.play("andandocima")
	else:
		animation_playerEli.play("idle")
