extends Node

var player_position = Vector2(1290,810)
var player_inventory = []
var total_score = 0
var house2_score = 0
var can_walk = true
var can_interact = true
var current_house
var switchlights_played = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	# cant get more than max points by replaying minigames
	if total_score > 180:
		total_score = 180
	if house2_score > 50:
		house2_score = 50

func doorslam():
	$Door.play()
