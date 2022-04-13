extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
	get_tree().change_scene("res://Scenes/Main.tscn")

func _on_House2Button_pressed():
	pass # Replace with function body.

func _on_House3Button_pressed():
	pass # Replace with function body.
