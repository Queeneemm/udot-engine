extends RigidBody2D

func _ready():
	pass # Replace with function body.



func _on_Enemy1DMG_body_entered(body):
	if body.is_in_group("player"):
		print("pizda")
