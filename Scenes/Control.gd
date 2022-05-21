extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_bar(value):
	$Tween.remove_all()
	$Tween.interpolate_property($TextureProgress, "value", null, int(value), 0.25)
	$Tween.start()
	#print($TextureProgress.value)
