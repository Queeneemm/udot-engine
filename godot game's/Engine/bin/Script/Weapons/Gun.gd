extends Node2D

export var bullet_speed = 1000
export var fire_rate = 0.2

var bullet = load("res://Engine/bin/Script/Weapons/Bullet.tscn")
var can_fire = true

func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
		
func _ready():
	pass # Replace with function body.


