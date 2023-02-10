extends KinematicBody2D

var speed = 150
var velocity = Vector2()

func _physics_process(delta):
	_update_movement(delta)
	_set_animation()

func _update_movement(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _set_animation():
	var anim = "idle"
	if velocity.x > 0:
		anim = "andandoladod"
	elif velocity.x < 0:
		anim = "andandoladoe"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)
