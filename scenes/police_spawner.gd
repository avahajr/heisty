extends Node2D

var police_scene = preload("res://scenes/police.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	$police_spawn.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_police_spawn_timeout():
	var pig = police_scene.instantiate()
	pig.position = $Bandit.position
	add_child(pig)

