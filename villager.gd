extends CharacterBody2D

@onready var animatedSpirte = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_flipped = false
func flip():
	if velocity.x < -0.5 and not is_flipped:
		scale.x *= -1
		is_flipped = true
	if velocity.x > 0.5 and is_flipped:
		scale.x *= -1
		is_flipped = false

func _process(delta):
	animatedSpirte.play("Idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		flip()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
