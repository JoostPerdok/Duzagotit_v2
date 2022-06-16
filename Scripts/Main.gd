extends Node

var score = 0
var house_scenes = ["Houses/House1_floor1", "Houses/House1_floor2", "Houses/House2_floor1", "Houses/House2_floor2"] # scenes where to show the progressbar


# main
func _ready():
	$Inventory.connect("rubbish_friend_start", self, "handle_rubbish_friend_start")
	$Inventory.connect("rubbish_friend_finish", self, "handle_rubbish_friend_finish")
	$Inventory.connect("ask_question", $SceneSwitcher, "handle_ask_question")
	randomize()


func _process(delta):
	if $SceneSwitcher.is_asking_question:
		$Score/Control/TextureProgress.hide()
		$Inventory.hide()
	elif $SceneSwitcher.current_level_name in house_scenes:
		$Score/Control/TextureProgress.show()
		$Inventory.show()
	else:
		$Score/Control/TextureProgress.hide()
		$Inventory.hide()


func handle_update_score(add_score):
	score += add_score
	$Score.update_score(add_score)

func handle_rubbish_friend_start():
	$SceneSwitcher.modulate = "#404040"

func handle_rubbish_friend_finish():
	$SceneSwitcher.modulate = "#ffffff"
	
