extends Node2D
signal fly_in_finished

var question = "Why are bananas yellow?"
var answer_right = "It's their favourite colour"
var answer_wrong1 = "They look like the sun"
var answer_wrong2 = "It gives them flavour"

var correct_answer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.hide()
	$Button2.hide()
	$Button3.hide()
	fly_in()

func fly_in():
	var pos = $Sprite.get_position()
	var x = pos[0]
	for i in range(100):
		$Sprite.position.x = x+8
		x = x + 8
		yield(get_tree(), "idle_frame") #waits execution of the loop one frame
	emit_signal("fly_in_finished")

func _on_main_fly_in_finished():
	$SpeechBubble.set_text(question)
	show_answers()

func show_answers():
	$Button.show()
	$Button2.show()
	$Button3.show()
	
	# randomize answers
	var randomint = randi() % 3
	if randomint == 0:
		correct_answer = 1
		$Button.text = answer_right
		$Button2.text = answer_wrong1
		$Button3.text = answer_wrong2
	if randomint == 1:
		correct_answer = 2
		$Button2.text = answer_right
		$Button.text = answer_wrong1
		$Button3.text = answer_wrong2
	if randomint == 2:
		correct_answer = 3
		$Button3.text = answer_right
		$Button2.text = answer_wrong1
		$Button.text = answer_wrong2


func _on_Button_pressed():
	if correct_answer == 1:
		pass

func _on_Button2_pressed():
	if correct_answer == 2:
		pass

func _on_Button3_pressed():
	if correct_answer == 3:
		pass
