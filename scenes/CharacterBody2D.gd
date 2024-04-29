extends CharacterBody2D

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
@onready var sprite2D = $AnimatedSprite2D

func _process(delta: float) -> void: 
	#gets player input
	var x_axis = Input.get_axis("ui_left", "ui_right")
	var y_axis = Input.get_axis("ui_up", "ui_down")
	var input := Vector2(x_axis, y_axis).normalized()
	
	var speed := 100.0 
	
	#move player
	position += input * speed * delta 
	
	if input == Vector2(1,0): 
		sprite2D.play("walk-right")
	elif input == Vector2(-1,0): 
		sprite2D.play("walk-left")
	elif input == Vector2(0,1): 
		sprite2D.play("walk-down")
	elif input == Vector2(0, -1):
		sprite2D.play("walk-up")
	elif input == Vector2(0,0): 
		sprite2D.play("idle-down") 
	
	move_and_slide()
	
	
	
	
	
	
	


