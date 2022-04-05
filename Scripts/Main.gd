extends Node

# main
func new_game():
	$Player.position = (Vector2(600,900))
	
	$Player.show()
	print($Player.get_index())
	#remove_child(house)

# main
func _ready():
	$Player.hide()
	new_game()
	randomize()
