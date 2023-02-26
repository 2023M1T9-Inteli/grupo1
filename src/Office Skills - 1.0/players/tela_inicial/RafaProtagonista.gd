extends Sprite

# Referência ao AnimationPlayer / AnimationPlayer Reference
var animation_player = null

# 
func _ready():
	# Chamar animação. / Call Animation
	animation_player = get_node("AnimationPlayer")
	# Animação olhando lados / Looking sideways animation
	animation_player.play("olharlados")


