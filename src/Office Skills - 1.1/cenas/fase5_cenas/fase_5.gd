extends Node2D







#quando todos cards forem movimentados aparecer botão de fim / when all cards have been moved show final screen button.
func _process(delta):
	if Global.card1mexe == true and Global.card2mexe == true and Global.card3mexe == true and Global.card4mexe == true and Global.card5mexe == true and Global.card6mexe == true:
		$botfim.visible = true
		

#botão para tela final / final scene  button
func _on_TextureButton_pressed():
	get_tree().change_scene("res://cenas/final/telafinal.tscn")


func _on_Area2D_area_entered(area):
	pass # Replace with function body.
