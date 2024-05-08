extends CharacterBody2D

@onready var sprite2D = $AnimatedSprite2D
@onready var footstep = $footsteps
@onready var flamethrower = $flamethrower
var shoot = false

func _process(delta: float) -> void: 
	#gets player input
	var x_axis = Input.get_axis("ui_left", "ui_right")
	var y_axis = Input.get_axis("ui_up", "ui_down")
	var input := Vector2(x_axis, y_axis).normalized()
	
	var speed := 150.0 
	
	position += input * speed * delta 
	
	if input == Vector2(1,0): 
		sprite2D.play("walk-right")
		flamethrower.z_index = 1   # Render in front
		#play_footstep()				
	elif input == Vector2(-1,0): 
		sprite2D.play("walk-left")
		flamethrower.z_index = 1   # Render in front		
		#play_footstep()
	elif input == Vector2(0,1): 
		sprite2D.play("walk-down")
		flamethrower.z_index = 1   # Render in front		
		#play_footstep()
	elif input == Vector2(0, -1):
		flamethrower.z_index = -1  # Render behind
		sprite2D.play("walk-up")
		#play_footstep()
	elif input == Vector2(0,0): 
		sprite2D.play("idle-down") 
		flamethrower.z_index = 1   # Render in front
		
	
	
	var mouse_pos = get_global_mouse_position()
	flamethrower.look_at(mouse_pos)
	
	if (Input.get_action_raw_strength("click")):
		if (!shoot):
			$flamethrower/fire.restart()
			shoot = true
		$flamethrower/fire.show()
	else:
		shoot = false
		$flamethrower/fire.hide()		
		
	move_and_slide()
	
func play_footstep():
	if $AnimatedSprite2D.animation.begins_with("walk-"):
		
		footstep.volume_db = randf_range(-10, -5) 
		footstep.play()
	
	
