extends Node2D

signal update_score

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$CanvasLayer/Message.text = "+10"
	$CanvasLayer/Message.hide()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("throw_ball"):	#spacebar
		$CanvasLayer/AnimationPlayer.play("show_message")
		score += 10
		$Control.update_bar(score)

func update_score(score: int):
	$CanvasLayer/Message.text = "+" + String(score)
	if score == 0:
		$CanvasLayer/Message.add_color_override("font_color", Color(255,0,0))
	if score == 5:
		$CanvasLayer/Message.add_color_override("font_color", Color(255,255,255))
	if score == 10:
		$CanvasLayer/Message.add_color_override("font_color", Color(0,255,0))
	$CanvasLayer/AnimationPlayer.play("show_message")
	get_parent().emit_signal("update_score", score)
	#$CanvasLayer.update_score(score)
	$Control.update_bar(score)
