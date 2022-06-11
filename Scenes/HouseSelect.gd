extends Node2D

signal level_changed(next_level_name)


# Called when the node enters the scene tree for the first time.
func _ready():
	$House1Highlight.hide()
	$House2Highlight.hide()
	$House3Highlight.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $House1Button.is_hovered():
		$House1Highlight.show()
	else:
		$House1Highlight.hide()
	
	if $House2Button.is_hovered():
		$House2Highlight.show()
	else:
		$House2Highlight.hide()

	if $House3Button.is_hovered():
		$House3Highlight.show()
	else:
		$House3Highlight.hide()


func _on_House1Button_pressed():
	emit_signal("level_changed", "Houses/House1_floor1")

func _on_House2Button_pressed():
	emit_signal("level_changed", "Houses/House2")

func _on_House3Button_pressed():
	emit_signal("level_changed", "Houses/House3")
