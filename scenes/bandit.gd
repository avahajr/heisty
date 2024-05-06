extends CharacterBody2D

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

@onready var sprite2D = $AnimatedSprite2D
@onready var footstep = $footsteps
@onready var flamethrower = $flamethrower


func _process(delta: float) -> void: 
	#gets player input
	var x_axis = Input.get_axis("ui_left", "ui_right")
	var y_axis = Input.get_axis("ui_up", "ui_down")
	var input := Vector2(x_axis, y_axis).normalized()
	
	var speed := 150.0 
	var previous_y = 0
	#move player
	position += input * speed * delta 
	
	if input == Vector2(1,0): 
		sprite2D.play("walk-right")
		
		
	elif input == Vector2(-1,0): 
		sprite2D.play("walk-left")
		flamethrower.z_index = 1   # Render in front		
	elif input == Vector2(0,1): 
		sprite2D.play("walk-down")
		flamethrower.z_index = 1   # Render in front		
	elif input == Vector2(0, -1):
		flamethrower.z_index = -1  # Render behind
		sprite2D.play("walk-up")
	elif input == Vector2(0,0): 
		sprite2D.play("idle-down") 
		flamethrower.z_index = 1   # Render in front
		
	
	
	var mouse_pos = get_global_mouse_position()
	flamethrower.look_at(mouse_pos)


	move_and_slide()
	
func play_sound():
	footstep.volume_db = randf_range(-10, -5) 
	footstep.play()
	
	
