extends RigidBody2D
var damage = 30

func _on_Bullet_body_entered(body):
	if !body.is_in_group("player"):
		queue_free()
	if body.is_in_group("Enemy"):
		body.OnHit(damage)
