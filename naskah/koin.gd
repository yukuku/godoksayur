extends Area2D

@onready var wasit = %Wasit
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	wasit.dapet_koin()
	animation_player.play("ambil")
	
