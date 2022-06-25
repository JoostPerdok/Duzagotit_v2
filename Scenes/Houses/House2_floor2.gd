extends Node2D

signal level_changed

var player
var interact_switchlights = false
var interact_gadget = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$House/Gadgetgame/GadgetHighlight.hide()
	$Player.position = Global.player_position


func _process(delta):
	if Input.is_action_pressed("ui_accept") and interact_switchlights == true:
		Global.player_position = $Player.position
		emit_signal("level_changed", "Minigames/SwitchLights/SwitchLights")
		print("active switchlights")
	
	if Input.is_action_pressed("ui_accept") and interact_gadget == true:
		Global.player_position = $Player.position
		emit_signal("level_changed", "Minigames/GadgetGame/GadgetGame")
		print("gadget")


func _on_Stairs_body_entered(body):
	if body == $Player:
		emit_signal("level_changed", "Houses/House2_floor1")

func _on_SwitchLights_body_entered(body):
	if body == $Player:
		interact_switchlights = true

func _on_SwitchLights_body_exited(body):
	if body == $Player:
		interact_switchlights = false


func _on_Gadgetgame_body_entered(body):
	if body == $Player:
		$House/Gadgetgame/GadgetHighlight.show()
		interact_gadget = true


func _on_Gadgetgame_body_exited(body):
	if body == $Player:
		$House/Gadgetgame/GadgetHighlight.hide()
		interact_gadget = false



