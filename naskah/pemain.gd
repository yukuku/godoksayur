extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("loncat") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("gerak_kiri", "gerak_kanan")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true 
	
	# animasi
	if is_on_floor():
		if direction == 0: 
			animated_sprite.play("nganggur")
		else:
			animated_sprite.play("lari")
	else:
		animated_sprite.play("loncat")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
