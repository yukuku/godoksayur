extends CharacterBody2D

const LAJU_JALAN = 60
const LAJU_LONCAT = -300.0

var arah = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var pancar_sinar_kanan = $"Pancar sinar kanan"
@onready var pancar_sinar_kiri = $"Pancar sinar kiri"

@onready var sensor_lantai_kanan = $"Sensor lantai kanan"
@onready var sensor_lantai_kiri = $"Sensor lantai kiri"


@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# awas nabrak
	if pancar_sinar_kanan.is_colliding():
		arah = -1
	if pancar_sinar_kiri.is_colliding():
		arah = +1
		
	# awas jatoh
	if not sensor_lantai_kanan.is_colliding():
		arah = -1
	if not sensor_lantai_kiri.is_colliding():
		arah = +1
		
	animated_sprite.flip_h = arah != 1
		
	if arah:
		velocity.x = arah * LAJU_JALAN
	else:
		velocity.x = move_toward(velocity.x, 0, LAJU_JALAN)

	move_and_slide()
	
