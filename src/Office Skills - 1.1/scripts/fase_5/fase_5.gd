extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.card1mexe == true and Global.card2mexe == true and Global.card3mexe == true and Global.card4mexe == true and Global.card5mexe == true and Global.card6mexe == true:
		$botfim.visible = true
		

#botão para tela final / final scene  button
func _on_TextureButton_pressed():
	get_tree().change_scene("res://cenas/final/telafinal.tscn")


func _on_Area2D_area_entered(area):
	pass # Replace with function body.
