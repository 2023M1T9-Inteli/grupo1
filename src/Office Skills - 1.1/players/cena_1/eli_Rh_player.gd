extends KinematicBody2D

 # Posição alvo final do NPC / NPC Target Postions
var target_position = Vector2(400, 118)
var target_position2 = Vector2(685, 160)

# Step é a etapa atual da animação do movimento / Current animation step.
var step = 1 

# Velocidade atual do NPC / NPC current velocity.
var velocity = Vector2() 

# Velocidade de movimento do NPC / NPC movement speed.
var speed = 50

# Referência ao AnimationPlayer / AnimationPlayer reference 
var animation_player = null 

#Variavel para quando jogador alcança o destino / Variable for when pleayer reaches destination
var arrived = false

func _ready():
	# Pegar o node da animação do personagem / Gets character animation node.
	animation_player = get_node("anim")
	if not animation_player:
		print("AnimationPlayer não encontrado")

func _process(delta):
	# Se o movimento da eli for acionado depois do dialogo, ela fará a 3 etapa da animação. / If Eli movement is triggered after dialog, activate animation step 3.
	if Global.movimento_2_eli == true:
		step = 3 
	
func _physics_process(delta):
	# Calcular a direção do movimento / Calculate movement direction
	var direction = Vector2()
	
	print(position.x)
	print(position.y)
	# Etapas de animação/ Animation steps
	if step == 1:
		direction = Vector2(target_position.x - position.x, 0)
		if abs(direction.x) < speed * delta:
			step = 2
			direction.x = 0
	if step == 2:
		direction = Vector2(0, target_position.y - position.y)
		if abs(direction.y) < speed * delta:
			direction.y = 0
			velocity = Vector2()
			arrived = true
	if step == 3:
		direction = Vector2(0, target_position2.y - position.y)
		if abs(direction.y) < speed * delta:
			if arrived:
				step = 4
				direction = Vector2(target_position2.x - position.x, 0)
			else:
				step = 4
				direction = Vector2(target_position2.x - position.x, 0)
	if step == 4:
		direction = Vector2(target_position2.x - position.x, 0)
		if abs(direction.x) < speed * delta:
			arrived = true
			direction.x = 0

	# Normalizar a direção para obter a velocidade / Normalize direction to obtain speed.
	velocity = direction.normalized() * speed

	# Executar o movimento com move_and_slide / Execute movement with move_and_slide
	move_and_slide(velocity, Vector2(0, 0))
	
	# Definir a animação de acordo com a direção / Set the animation accordingly to the direction.
	if velocity.x > 0:
		animation_player.play("andandoladod")
	elif velocity.x < 0:
		animation_player.play("andandoladoe")
	elif velocity.y > 0:
		animation_player.play("andandobaixo")
	elif velocity.y < 0:
		animation_player.play("andandocima")
	else:
		animation_player.play("idle")
