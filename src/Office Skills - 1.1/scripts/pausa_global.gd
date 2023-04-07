extends CanvasLayer

onready var botaoContinuar = $Continuar #botão continuar
onready var botaoReiniciar = $Reiniciar #botão reiniciar
onready var texRect = $TextureRect #textura transparente
onready var sliderVolume = $Volume #barra de volume
onready var valorVolume = $ValorVolume #porcentagem do volume

func _ready():
# Botões do menu ficam invisíveis quando o códidgo é executado inicialmente / Buttons stay invisible when the code is executed initialy
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	sliderVolume.visible = false
	valorVolume.visible = false

func _input(event: InputEvent):
	# Quando a tecla "TAB" é apertada os botões do menu aparecem / When the key "TAB" is pressed the menu buttons appear
	if event.is_action_pressed("press_tab"):
		# O jogo é pausado / The game pauses
		get_tree().paused = !get_tree().paused 
		botaoContinuar.visible = !botaoContinuar.visible
		botaoReiniciar.visible = !botaoReiniciar.visible
		texRect.visible = !texRect.visible
		sliderVolume.visible = !sliderVolume.visible
		valorVolume.visible = !valorVolume.visible
	
func _on_Continuar_pressed(): 
# Se "continuar" for apertado a tela de pause some / If "continuar" is pressed the pause screen disappears
	get_tree().paused = false
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	sliderVolume.visible = false
	valorVolume.visible = false
	# Efeito sonoro do botão quando pressionado / Button sound effect when pressed
	$AudioStreamPlayer.play()

# Se "reiniciar" for apertado o jogador é retornado à tela inicial e o menu de pause some / If "reiniciar" is pressed the player is returned to the start screen and the pause menu disappears
func _on_Reiniciar_pressed():
	get_tree().change_scene("res://cenas/tela_inicial.tscn")
	get_tree().paused = false
	botaoContinuar.visible = false
	botaoReiniciar.visible = false
	texRect.visible = false
	sliderVolume.visible = false
	valorVolume.visible = false
	# Efeito sonoro do botão quando pressionado / Button spund effect when pressed
	$AudioStreamPlayer.play()
	
# Altera o texto de porcentagem do volume / Changes the volume percentage text
func _on_Volume_value_changed(value):
	set_bus_volume(0, value)
	$ValorVolume.text = "%d%%" % (value * 100)
	
# Altera o volume do jogo / Changes the game volume
func set_bus_volume(bus_index: int, value: float):
	AudioServer.set_bus_volume_db(bus_index, linear2db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.01)

