extends Node

var player_position = Vector2(1290,810)
var player_inventory = []
var total_score = 0
var house2_score = 0
var can_walk = true
var current_house


func _ready():
	pass # Replace with function body.

func doorslam():
	$Door.play()
