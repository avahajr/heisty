extends CharacterBody2D

# Timer node for changing orientation
@onready var spin_timer = $spin_timer
@onready var _animated_sprite = $AnimatedSprite2D
var direction = randi() % 4
var sight_distance = 50

var enemy_cooldown = true

func _ready():
	spin_timer.wait_time = randf_range(0, 1)
	spin_timer.autostart = true
	spin_timer.start()


func _process(delta):
	# Assume the RayCast2D node is named "RayCast2D" and is a child of this sprite
	var ray_cast = $RayCast2D

	# Make sure the raycast is enabled
	ray_cast.enabled = true
	
	match direction:
		0: ray_cast.set_target_position(Vector2(0, sight_distance))
		1: ray_cast.set_target_position(Vector2(-sight_distance, 0))
		2: ray_cast.set_target_position(Vector2(0, sight_distance))
		3: ray_cast.set_target_position(Vector2(sight_distance, 0))

	# Check if the raycast hits something
	if ray_cast.is_colliding():
		var collider = ray_cast.get_collider()
		print("Hit: ", collider.name)

		# Optionally, you could react to the collision here, e.g., damage an enemy
				
				
func _on_spin_timer_timeout():
	# Randomly change the sprite direction when the timer times out
	direction = randi() % 4
	match direction:
		0: _animated_sprite.play('idle-down')
		1: _animated_sprite.play('idle-right')
		2: _animated_sprite.play('idle-up')
		3: _animated_sprite.play('idle-left')
	
	# Reset the timer with a new random interval
	spin_timer.wait_time = randf_range(0, 1)
	spin_timer.start()


func _on_attack_cooldown_timeout():
	enemy_cooldown = true 
