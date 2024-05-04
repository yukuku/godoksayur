extends Node

var duit: int = 0

@onready var label_duit = $"../CanvasLayer/Label duit"

func _process(delta):
	apdet_duit()

func dapet_koin():
	duit += 10
		
func apdet_duit():
	label_duit.text = "Duit " + str(duit)
	
