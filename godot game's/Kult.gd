extends KinematicBody2D

var velocity = Vector2.ZERO


func _ready():
	pass 

func _process(delta):
	if Input.is_action_pressed("move_left"):
		velocity.x -= 100
	if Input.is_action_pressed("move_right"):
		velocity.x += 100
	if Input.is_action_pressed("move_down"):
		velocity.y += 100
	if Input.is_action_pressed("move_up"):
		velocity.y -= 100
	position = velocity * delta
