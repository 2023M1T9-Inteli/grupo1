extends Sprite

# Referência ao AnimationPlayer / AnimationPlayer Reference
var animation_playerRafa = null

# 
func _ready():
	# Chamar animação. / Call Animation
	animation_playerRafa = get_node("AnimationPlayer")
	# Animação olhando lados / Looking sideways animation
	animation_playerRafa.play("olharlados")


