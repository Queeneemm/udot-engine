extends KinematicBody2D

var max_hp = 100
var current_hp
export var speed = 100
var velocity = Vector2.ZERO
var path = []
var threshold = 16
var nav = null

func _ready():
	yield(owner, "ready")
	nav = owner.nav
	current_hp = max_hp
	$AnimationPlayer.play()
	
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()

func move_to_target():
	if global_position.distance_to(path[0]) < threshold:
		path.remove(0)
	else:
		var direction = global_position.direction_to(path[0])
		velocity = direction * speed
		velocity = move_and_slide(velocity)
		
func get_target_path(target_pos):
	path = nav.get_simple_path(global_position, target_pos, false)

func OnHit(damage):
	print("mne pizda")
	current_hp -= damage
	if current_hp <= 0:
		queue_free()
		self.hide()

