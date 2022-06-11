extends Node2D

signal level_changed(next_level_name)

var player


# Called when the node enters the scene tree for the first time.
func _ready():
	#player = load("res://Scenes/Player.tscn").instance()
	#$Player.position = (Vector2(1445, 945))
	#add_child(player)
	pass


func _on_Stairs_body_entered(body):
	emit_signal("level_changed", "Houses/House1_floor2")


func _process(delta):
	if Input.is_action_pressed("start_minigame"):
		emit_signal("level_changed", "Minigames/Tshirt/TshirtLevel1")



func _on_Frontdoor_body_entered(body):
	emit_signal("level_changed", "HouseSelect")
