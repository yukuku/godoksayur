extends Node

var duit: int = 0

@onready var label_status = $"../CanvasLayer/Label status"
@onready var pemain: Pemain = $"../Pemain"

func _process(delta):
	apdet_status()

func dapet_koin():
	duit += 10
		
func apdet_status():
	label_status.text = "HP   " + str(pemain.hp) + "\nDuit " + str(duit)
	
