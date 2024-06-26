extends CharacterBody2D
class_name Pemain

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var uda_loncat = 0
var hp = 100

@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Double jump
	if is_on_floor():
		uda_loncat = 0

	if Input.is_action_just_pressed("loncat"):
		if uda_loncat < 2:
			velocity.y = JUMP_VELOCITY
			uda_loncat += 1

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




func kena(atk: float):
	print('kena atk=' + str(atk))
	hp -= atk
	if hp < 0:
		mati()
		
		
func mati():
	hp = 0
	Engine.time_scale = 0.5
	$CollisionShape2D.queue_free()
	
	animated_sprite.play("mati")
	timer.start()
	


func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
