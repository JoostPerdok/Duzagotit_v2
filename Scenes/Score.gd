extends Node2D


var score

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$CanvasLayer.show()
	$CanvasLayer/Message.text = "+10"
	$CanvasLayer.update_score(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("throw_ball"):	#spacebar
		$CanvasLayer/AnimationPlayer.play("show_message")
		score += 10
		$CanvasLayer.update_score(score)
		$Control.update_bar(score)
	
	#$Control/TextureProgress.value = int($CanvasLayer/ScoreBox/HBoxContainer/Score.text)
