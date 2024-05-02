extends Node2D

const LAJU = 60

var arah = 1

@onready var pancar_sinar_kanan = $"Pancar sinar kanan"
@onready var pancar_sinar_kiri = $"Pancar sinar kiri"
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pancar_sinar_kanan.is_colliding():
		arah = -1
		animated_sprite.flip_h = true
	if pancar_sinar_kiri.is_colliding():
		arah = +1
		animated_sprite.flip_h = false
	position.x += arah * LAJU * delta
	
