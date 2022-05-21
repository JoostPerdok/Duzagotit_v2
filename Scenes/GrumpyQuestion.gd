extends Node2D

signal fly_in_finished
signal level_changed

var question # = "Why are bananas yellow?"
var answer_right # = "It's their favourite colour"
var answer_wrong1 # = "They look like the sun"
var answer_wrong2 # = "It gives them flavour"
var explanation = "Omdat blablablbla"

var correct_answer
var already_answered = false
var next_level
var correct_button

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	read_json()
	$Button1.hide()
	$Button2.hide()
	$Button3.hide()
	fly_in()
	

func fly_in():
	var pos = $AnimatedSprite.get_position()
	var x = pos[0]
	for i in range(100):
		$AnimatedSprite.position.x = x+8
		x = x + 8
		yield(get_tree(), "idle_frame") #waits execution of the loop one frame
	emit_signal("fly_in_finished")

func _on_main_fly_in_finished():
	$SpeechBubble.set_text(question)
	show_answers()
	#$Tween.interpolate_property($Button)
	

func show_answers():
	$Button1.show()
	$Button2.show()
	$Button3.show()
	
	# randomize answers
	var randomint = randi() % 3
	if randomint == 0:
		correct_answer = 1
		$Button1.text = answer_right
		$Button2.text = answer_wrong1
		$Button3.text = answer_wrong2
		
		correct_button = $Button1
	if randomint == 1:
		correct_answer = 2
		$Button2.text = answer_right
		$Button1.text = answer_wrong1
		$Button3.text = answer_wrong2
		
		correct_button = $Button2
	if randomint == 2:
		correct_answer = 3
		$Button3.text = answer_right
		$Button2.text = answer_wrong1
		$Button1.text = answer_wrong2
		
		correct_button = $Button3


func _on_Button_pressed():
	if already_answered:
		return
	
	if correct_answer == 1:
		flash_button($Button1, 1)
	else:
		flash_button($Button1, 0)
	
	already_answered = true

func _on_Button2_pressed():
	if already_answered:
		return
	
	if correct_answer == 2:
		flash_button($Button2, 1)
	else:
		flash_button($Button2, 0)
	
	already_answered = true

func _on_Button3_pressed():
	if already_answered:
		return
	
	if correct_answer == 3:
		flash_button($Button3, 1)
	else:
		flash_button($Button3, 0)
	
	already_answered = true


func flash_button(button, correct):			#0 incorrect, 1 correct
	var correct_style = StyleBoxFlat.new()
	var wrong_style = StyleBoxFlat.new()
	correct_style.set_bg_color(Color('#197711'))
	wrong_style.set_bg_color(Color('#c31f1f'))
	#$Button.set("custom_styles/normal", correct_style)
	
	if correct:
		button.set("custom_styles/normal", correct_style)
		button.set("custom_styles/hover", correct_style)
	else:
		button.set("custom_styles/normal", wrong_style)
		button.set("custom_styles/hover", wrong_style)
		
		correct_button.set("custom_styles/normal", correct_style)
		correct_button.set("custom_styles/hover", correct_style)
	
	$RichTextLabel.text = explanation
	
	end_question()


func read_json():
	var file = File.new()
	file.open("res://Assets/questions.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	
	var rand = randi()
	var randomint = rand % json_result.size()
	var questionanswer = json_result[randomint]
	print(rand, randomint)
	
	question = questionanswer["question"]
	answer_right = questionanswer["correct_answer"]
	answer_wrong1 = questionanswer["wrong_answer1"]
	answer_wrong2 = questionanswer["wrong_answer2"]

func end_question():
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
	emit_signal("level_changed", next_level)
