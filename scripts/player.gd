extends KinematicBody2D

var speed = 150
# "speed" é uma variável inteira que armazena a velocidade do player em pixels por segundo
var velocity = Vector2()
# "velocity" é uma variável que armazena a velocidade atual do objeto na direção x 

func _physics_process(delta):
# "_physics_process" é uma função responsável por atualizar a movimentação do personagem 
	_update_movement(delta)
	_set_animation()

func _update_movement(delta):
# _update_movemento é uma função que atualiza a velocidade do personagem de acordo com a entrada do jogador (se eles estão pressionando "move_right" ou "move_left")
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _set_animation():
#set_animationpermite é uma função para controlar as animações, isto inclui configurar a velocidade, pausar ou continuar a animação.
	var anim = "idle"
	if velocity.x > 0:
		anim = "andandoladod"
	elif velocity.x < 0:
		anim = "andandoladoe"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)
