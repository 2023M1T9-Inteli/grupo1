extends ColorRect
# Define a variável dialogPath que será usada para obter o arquivo JSON que contém o diálogo que precisamos / Sets the variable dialogPath used to obtain the JSON file which contains the dialog.
export var dialogPath = ""

# Define a velocidade do texto que será usada / Sets text speed.
export(float) var textSpeed = 0.05

var dialogFase4
var phraseNumFase4 = 0

# Texto encerrado / Text finished.
var finishedFase4 = false

func _ready():
	
	finishedFase4 = true
	# Define o tempo de espera do timer com a velocidade do texto / Sets timer wait time with text speed.
	$Timer.wait_time = textSpeed
	
	# Obtém o diálogo / Obtains dialog
	dialogFase4 = getDialog()
	
	# Garante que a função getDialog funcionou / Ensures getDialog function worked
	assert(dialogFase4, "Diálogo não encontrado")
	
	# Inicia a próxima frase / Starts next phrase
	nextPhrase()
	
func _process(delta):
	# Verificando se o jogador pressionou a tecla "enter" / Check if wnter key is pressed.
	if Input.is_action_just_pressed("ui_accept") :
		if finishedFase4:
			# Exibindo a próxima frase /  Display the next sentence
			nextPhrase()
			$AudioStreamPlayer.play()
		else:
			$Text.visible_characters = len($Text.text) # Se o texto ainda não terminou, o jogador pode pular para o fim do diálogo pressionando "enter"
	
	
func getDialog() -> Array:
	var f = File.new()
	
	# Verificando se o arquivo especificado existe / Checks if specified file exists.
	assert(f.file_exists(dialogPath), "Caminho do arquivo não existe")
	
	# Abrindo o arquivo especificado / Opens specified file.
	f.open(dialogPath, File.READ)
	
	# Obtendo os dados do arquivo em formato de texto / Obtains file data in text format.
	var json = f.get_as_text()
	
	# Convertendo o texto em uma variável utilizável (neste caso, uma matriz) / Converts text in usable variable.
	var output = parse_json(json)
	
	# Verificando se a variável de saída é uma matriz, caso contrário, retornando uma lista vazia. / Checks if the output variable is an array, if not, returns an empty list.
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return[]
		
func nextPhrase() -> void:
	# Verificando se todas as frases do diálogo foram exibidas / Checks if all dialog phrases were displayed.
	if phraseNumFase4 >= len(dialogFase4):
		Global.final_dialogo1_fase2 = true
		queue_free()
		Global.desbloquear_movimentos()
		return
	
	finishedFase4 = false
	$Name.bbcode_text = dialogFase4[phraseNumFase4]["Name"]
	$Text.bbcode_text = dialogFase4[phraseNumFase4]["Text"]
	
	$Text.visible_characters = 0
	
	# Exibindo a frase letra por letra com um tempo de espera / Displays phrase letter by letter with a wait time.
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1

		$Timer.start()
		yield($Timer,"timeout")
	
	finishedFase4 = true
	phraseNumFase4 += 1
	return
