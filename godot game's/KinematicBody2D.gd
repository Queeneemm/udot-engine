extends KinematicBody2D
var hp = 100
var current_hp
var direction: Vector2 = Vector2.ZERO
var damage = 100
export var speed: = 100
func _ready():
	current_hp = hp
	pass

func _physics_process(delta):
	direction = (Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		)).normalized()
	move_and_slide(direction * speed)
		


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		current_hp -= damage
		if current_hp <= 0:
			queue_free()
			self.hide()
