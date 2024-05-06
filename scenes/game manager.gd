extends Node
@onready var pointLabel = %Label

var points = 0 

func addPink(): 
	if(points != 10):
		points = points + 2 
		print(points)
		pointLabel.text = "Total Points: " + str(points)
	check_end_scence()

func addBlue(): 
	if(points != 10):
		points = points + 1
		print(points)
		pointLabel.text = "Total Points: " + str(points) 
	check_end_scence()

func addChest(): 
	if(points != 10):
		points = points + 5
		print(points)
		pointLabel.text = "Total Points: " + str(points)
	check_end_scence()

func check_end_scence(): 
	if(points == 10): 
		get_tree().change_scene_to_file("res://scenes/win scene.tscn")
	
