extends Node

var score = 0

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

func _process(delta):
	if $SceneSwitcher.current_level_name == "Houses/House1":
		$Score/Control/TextureProgress.show()
	elif $SceneSwitcher.current_level_name == "HouseSelect": 
		#show all progress bars
		pass
	else:
		$Score/Control/TextureProgress.hide()

func handle_update_score(add_score):
	score += add_score
	$Score.update_score(score)
