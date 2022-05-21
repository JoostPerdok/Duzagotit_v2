extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func show_message(text):
	$Message.text = text
	$AnimationPlayer.play("show_message")

func hide():
	$Scorebox.hide()

func show():
	$ScoreBox.show()

func update_score(value):
	$ScoreBox/HBoxContainer/Score.text = str(value)
