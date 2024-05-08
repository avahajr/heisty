extends Node2D

var police_scene = preload("res://scenes/police.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	$police_spawn.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_police_spawn_timeout():
	print('spawn police now...')
	var pig = police_scene.instantiate()
	
	
	var bandit = $Bandit.position  # Get the position of the bandit
	var angle = randf_range(0, 2 * PI)  # Random angle in radians
	var radius = 50  # Random radius from 0 to 50 pixels
	
	# Calculate the new position
	var x_offset = cos(angle) * radius
	var y_offset = sin(angle) * radius
	var new_position = bandit + Vector2(x_offset, y_offset)
	
	pig.position = new_position
	
	pig.set("player", $Bandit)
	add_child(pig)

