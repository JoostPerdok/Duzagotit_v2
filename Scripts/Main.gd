extends Node

# main
func new_game():
	var position = (Vector2(600,900))
	
	#$Player.show()
	#print($Player.get_index())
	
	#load level
	#get_tree().change_scene("res://Scenes/Houses/House1.tscn")
	
	
	#remove_child(house)

# main
func _ready():
	#$Player.hide()
	new_game()
	randomize()
	
	
