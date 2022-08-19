extends KinematicBody2D
var health
var direction: Vector2 = Vector2.ZERO
export var speed: = 100
func _ready():
	$AnimatedSprite.play("IDLe")
	
	pass

func _physics_process(delta):
	direction = (Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		)).normalized()
	move_and_slide(direction * speed)
		
		
