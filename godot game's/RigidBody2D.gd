extends RigidBody2D
var screen_size


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 100
	if Input.is_action_pressed("move_right"):
		velocity.x += 100
	if Input.is_action_pressed("move_down"):
		velocity.y += 100
	if Input.is_action_pressed("move_up"):
		velocity.y -= 100
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x < 0
	position += velocity * delta
