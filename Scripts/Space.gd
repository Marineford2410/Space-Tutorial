extends Node
export (PackedScene) var Enemigo
var score

func _ready():
	randomize()
	
func nuevo_juego():
	score = 0
	$Nave.inicio($PositionInicial.position)
	$InicioTimeer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(score)
	$Musica.play()

func gameOver():
	$AudioMuerte.play()
	$ScoreTimer.stop()
	$EnemigoTimer.stop()
	$Interfaz.game_over()
	$Musica.stop()

func _on_InicioTimeer_timeout():
	$ScoreTimer.start()
	$EnemigoTimer.start() 

func _on_ScoreTimer_timeout():
	score += 1
	$Interfaz.update_score(score)

func _on_EnemigoTimer_timeout():
	$Camino/EnemigoPosition.set_offset(randi())
	var naveEnemiga = Enemigo.instance()
	add_child(naveEnemiga)
	
	var direccion = $Camino/EnemigoPosition.rotation + PI / 2
	naveEnemiga.position = $Camino/EnemigoPosition.position
	
	direccion += rand_range(-PI / 4, PI / 4)
	naveEnemiga.rotation = direccion
	naveEnemiga.set_linear_velocity(Vector2(rand_range(naveEnemiga.velocidad_min, naveEnemiga.velocidad_max), 0).rotated(direccion))
	
	
	
	
	
	
	
	