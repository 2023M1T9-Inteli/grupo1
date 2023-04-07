extends Node2D


# Botão para retornar para a tela inicial
func _on_TextureButton_pressed():
	get_tree().change_scene("res://cenas/tela_inicial.tscn")
