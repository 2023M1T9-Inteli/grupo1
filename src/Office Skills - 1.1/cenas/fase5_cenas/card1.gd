extends Button

var clicando = false
var position = Vector2()



func _on_card1_button_down():
	clicando = true


func _on_card1_button_up():
	clicando = false

func _process(delta):
	if clicando == true:
		position = get_global_mouse_position()
	
