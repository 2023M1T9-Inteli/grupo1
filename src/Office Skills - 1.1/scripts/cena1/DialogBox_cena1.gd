extends ColorRect

# Define a variável dialogPath que será usada para obter o arquivo JSON que contém o diálogo que precisamos / Sets the variable dialogPath used to obtain the JSON file which contains the dialog.
export var dialogPath = ""
# Define a velocidade do texto que será usada / Sets text speed.
export(float) var textSpeed = 0.05

# Define as variáveis dialog, phraseNum e finished / Sets variables dialog, phraseNum and finished
var dialog
var phraseNum = 0

# Texto encerrado / Text finished.
var finished = false

func _ready():
	# Define o tempo de espera do timer com a velocidade do texto / Sets timer wait time with text speed.
	$Timer.wait_time = textSpeed
	# Obtém o diálogo / Obtains dialog
	dialog = getDialog()
	# Garante que a função getDialog funcionou / Ensures getDialog function worked
	assert(dialog, "Dialogo nao achado")
	# Inicia a próxima frase / Starts next phrase
	nextPhrase()

func _process(delta):
	# Se o botão "Enter" for pressionado, vá para a próxima frase ou termine a atual / If "enter" key is pressed, go to next phrase on skip actual phrase.
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
			$AudioStreamPlayer.play()
		else:
			# Se o texto ainda não tiver acabado, o jogador pode pular o texto pressionando "Enter" / If text still going, player can skip pressing "enter".
			$Text.visible_characters = len($Text.text)

func getDialog() -> Array:
	# Cria um objeto do tipo File / Creates an objet typ file.
	var f = File.new()
	# Verifica se o arquivo de diálogo existe; se não existir, o jogo será encerrado e a mensagem ao lado será exibida / Checks if dialog file exists, if not, game crashes and displays the message.
	assert(f.file_exists(dialogPath), "File path não existe")
	# Abre o arquivo no caminho do diálogo / Opens file 
	f.open(dialogPath, File.READ)
	# Obtém o conteúdo do arquivo em formato de texto / Obtains file content in text format
	var json = f.get_as_text()
	# Converte o conteúdo do arquivo em uma variável utilizável (neste caso, uma matriz) / Converts file content in a usable variable.
	var output = parse_json(json)
	# Verifica se a variável de saída é uma matriz; se não for, retorna uma matriz vazia / Verifies if exit variable is an array, if not, returns the empty array.
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextPhrase() -> void:
	Global.bloquear_movimentos()
	# Se o número de frases for maior ou igual ao comprimento do diálogo, exclui a caixa de diálogo e retorna / If phrase number is greater or equal dialog lenght, removes dialog box and return.
	if phraseNum >= len(dialog):
		queue_free()
		Global.desbloquear_movimentos()
		Global.acionar_movimento_eli()
		return
	# Define a variável finished como falsa / Sets finished variable as false.
	finished = false
	# Define o texto do nome e do texto da caixa de diálogo / Sets text for "Name" and text for "Text" in dialog box.
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	# Define o número de caracteres visíveis como zero / Sets visible character as 0.
	$Text.visible_characters = 0
	# Enquanto o número de caracteres visíveis for menor do que o comprimento do texto, aumenta o número de caracteres visíveis em 1 / If character numer is equal or less than text lenght, increases visible characters in 1.
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		# Inicia o timer / Inicialize timer.
		$Timer.start()
		# Pausa a função até que o "timeout" seja emitido / Pauses function until "timeout"
		yield($Timer,"timeout")
	# Define a variável finished como verdadeira, aumenta o número de frases em 1 e retorna / Sets finished as true and increases number of phrases.
	finished= true
	phraseNum += 1
	return
