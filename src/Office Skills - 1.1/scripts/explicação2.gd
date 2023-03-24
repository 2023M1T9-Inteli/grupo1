extends Node2D

func _ready():
	pass # Replace with function body.

# quando botao enter do teclado for pressionado mudar a cena / change scene when entered key pressed. 
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://cenas//fase2_cenas/fase_2.tscn")

# Texto com link conectado que leva para o conteúdo / Text with a connected link that takes to the content
func _on_LinkButton_pressed():
	OS.shell_open("https://youtu.be/g_Ld-p6jv3A")

# Botão que leva o jogador à próxima fase / Button that takes the player to the next phase
func _on_Button_pressed():
	get_tree().change_scene("res://cenas/fase2_cenas/fase_2.tscn")
