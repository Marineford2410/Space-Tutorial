extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max

func _ready():
	pass

func _on_Visible_screen_exited():
	queue_free()