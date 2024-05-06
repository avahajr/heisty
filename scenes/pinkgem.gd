extends Area2D

@onready var gameManager = %"game manager"
var is_collected = false  

func _on_body_entered(body):
	if(body.name == "bandit") and not is_collected: 
		is_collected = true 
		$"../gemsound".play()
		hide()
		queue_free()
		gameManager.addPink()
		
