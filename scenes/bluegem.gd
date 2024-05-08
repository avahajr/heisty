extends Area2D

@onready var gameManager = %"game manager"
var is_collected = false 

func _on_body_entered(body):
	if(body.name == "Bandit") and not is_collected: 
		$"../../pinkgem/gemsound".play()
		is_collected = true 
		hide()
		queue_free()
		gameManager.addBlue()

