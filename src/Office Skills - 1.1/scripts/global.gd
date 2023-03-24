extends Node
# Variáveis e funções globais

# func para bloquear movimentos da rafa
func bloquear_movimentos():
	bloqueio = true

# func para desbloquear movimentos da rafa
func desbloquear_movimentos():
	bloqueio = false

# váriaveis da cena 1
var bloqueio = true
var movimento_2_eli = false
# função que aciona o movimento da eli
func acionar_movimento_eli():
	movimento_2_eli = true

# variáveis fase 1 - dialogo
var final_dialogo = false
var icone_mesa = false

# variáveis fase 1 - animação
var step2_eli = false
var step3_eli = false
var npc_thomas_active = false

# variáveis fase 1 - dialogo
func final_dialogo1():
	final_dialogo = true
var final_dialog2 = false
var dialogo3_thomas = false
var show_dialog3 = false

#variaveis fase 2
var final_dialogo1_fase2 = false

# variaveis fase 3
var final_dialogo1_fase3 = false

#variaveis fase 4
var final_dialogo1_fase4 = false

# variáveis fase 1 - decisao
var decisao1 = false
var show_desicion = false

#variaveis fase 5
var card1mexe = false
var card2mexe = false
var card3mexe = false
var card4mexe = false
var card5mexe = false
var card6mexe = false
