extends Node

var player_position = Vector2(1290,810)
var player_inventory = []
var total_score = 0
var can_walk = true
var current_house =2


func _ready():
	pass # Replace with function body.

func doorslam():
	$Door.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
