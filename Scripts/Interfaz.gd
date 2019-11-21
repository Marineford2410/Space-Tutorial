extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()

func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")
	$ButtonPlay.show()
	$Mensaje.text = "Space Guy"
	$Mensaje.show()

func update_score(puntos):
	$ScoreLabel.text = str(puntos)	

func _on_MensajeTimer_timeout():
	$Mensaje.hide()

func _on_ButtonPlay_pressed():
	$ButtonPlay.hide()
	emit_signal("iniciar_juego")
