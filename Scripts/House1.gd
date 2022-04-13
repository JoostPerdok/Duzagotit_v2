extends Node2D

var player_exists = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if !player_exists:
		player_exists = true
	else:
		#print("testing")
		get_tree().change_scene("res://Scenes/HouseSelect.tscn")
