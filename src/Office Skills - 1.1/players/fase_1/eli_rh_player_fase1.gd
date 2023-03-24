extends KinematicBody2D

# Posição alvo final do NPC / NPC target position.
var target_positionEli = Vector2(302, 250) 

# Etapa atual do movimento / Current movement step.
var stepEli = 1 

# Velocidade atual do NPC / NPC current speed 
var velocityEli = Vector2() 

# Velocidade de movimento do NPC / NPC movement speed.
var speedEli = 70 

# Referência ao AnimationPlayer / AnimationPlayer reference.
var animation_playerEli = null 

#Variavel para quando personagem chegar no ponto desejado. / Variable when player arrives target position.
var arrivedEli = false

#Chamando a animação do personagem. / Calls player animation.
func _ready():
	animation_playerEli = get_node("anim")
	if not animation_playerEli:
		print("AnimationPlayer não encontrado")
	
func _physics_process(delta):
	# Calcular a direção do movimento / Calculates movement direction.
	var direction = Vector2()
	
	#Rota pré-definida da personagem Eli. / Eli movement route.
	if stepEli == 1:
		direction = Vector2(216 - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			# Parar no x = 214 / Stops at x = 214 
			position.x = 216 
			stepEli = 2

	if stepEli == 2:
		direction = Vector2(0, 302 - position.y)
		if abs(direction.y) < speedEli * delta:
			# Parar no y = 302 / Stops at y = 302
			position.y = 302 
			stepEli = 3

	if stepEli == 3:
		direction = Vector2(286 - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			# Parar no x = 214 / Stops at x = 214
			position.x = 286 
			stepEli = 4
			
	if stepEli == 4:
		direction = Vector2(302 - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			# Parar no x = 302 / Stops at x = 302
			position.x = 302 
			stepEli = 5
			
	if stepEli == 5:
		direction = Vector2(0, 222 - position.y)
		if abs(direction.y) < speedEli * delta:
			# Parar no y = 222 / Stops at y = 222
			position.y = 222 
			arrivedEli = true
	
	if Global.step2_eli == true:
		direction = Vector2(0, 250 - position.y)
		if abs(direction.y) < speedEli * delta:
			position.y = 250
			stepEli = 0
			Global.step2_eli = false
	
	if Global.step3_eli == true:
		direction = Vector2(0, 317 - position.y)
		if abs(direction.y) < speedEli * delta:
			position.y = 317
			stepEli = 6
			Global.step2_eli = false
	
	if stepEli == 6:
		direction = Vector2(70 - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			position.x = 70
			stepEli = 7
	
	if stepEli == 7:
		direction = Vector2(0, 194 - position.y)
		if abs(direction.y) < speedEli * delta:
			position.y = 194
			stepEli = 8
	
	if stepEli == 8:
		direction = Vector2(3 - position.x, 0)
		if abs(direction.x) < speedEli * delta:
			position.x = 3
			Global.decisao1 = true
			stepEli = 0
	

	# Definir a velocidade atual do NPC com base na direção e na velocidade máxima / Sets NPC current speed based on direction and max speed. 
	velocityEli = direction.normalized() * speedEli
	
	# Atualizar a posição do NPC baseado na sua velocidade atual / Updates NPC postion based on current speed.
	position += velocityEli * delta
		
	# Executar o movimento com move_and_slide / Runs movement with move_and_slide
	move_and_slide(velocityEli, Vector2(0, -1))
	
	# Definir a animação de acordo com a direção / Sets animation according to direction.
	if velocityEli.x > 0:
		animation_playerEli.play("andandoladod")
	elif velocityEli.x < 0:
		animation_playerEli.play("andandoladoe")
	elif velocityEli.y > 0:
		animation_playerEli.play("andandobaixo")
	elif velocityEli.y < 0:
		animation_playerEli.play("andandocima")
	else:
		animation_playerEli.play("idleMovendo")

