extends Node
var dado_inicial : int
var tirada_anterior : int
var tirada_actual : int


func _ready():
	#inicia el juego
	inicializar_juego()

func inicializar_juego():
	#configurar cualquier inicialización necesaria
	#tirada_anterior = -1
	dado_inicial = randi() % 6 + 1
	print("dado", dado_inicial)
	tirada_anterior = dado_inicial
	realizar_tirada()
	
func realizar_tirada():
	#te da un número aleatorio para la tirada actual
	tirada_actual = randi() % 6 + 1 #numeros del 1 al 6 para simular un dado
	
	#mostramos la tirada actual en la consola
	print("Tirada_actual:", tirada_actual)
	
	if tirada_anterior != dado_inicial:
		print("Y bien? piensas que es más alta o más baja?", dado_inicial)
		#esto interpretara que hay dos botones conectados llamados alta/baja
		tirada_anterior = tirada_actual
		conectar_botones()
	
func comparar_tiradas(prediccion: String):
	#aciertos
	if tirada_actual > tirada_anterior and prediccion == "alta":
		print("¡Acierto!") #más alta
	elif tirada_actual < tirada_anterior and prediccion == "baja":
		print("¡Acierto!") #más baja
	#fallos
	else: 
		print("INCORRECTO! la tirada es",tirada_actual)
 # Agregar aquí la lógica adicional para manejar la pérdida del jugador (quieres jugar de nuevo? por ejemplo)
func conectar_botones():
	$alto.connnect("pressed",self,"_on_button_pressed",["alta"])
	$bajo.connnect("pressed",self,"_on_button_pressed",["baja"])
	
func _on_button_pressed(prediccion: String):
	#se llama cuando se presiona uno de los botones
	#comparar con la tirada anterior
	comparar_tiradas(prediccion)
