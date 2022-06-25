extends Node2D

signal level_changed

var player
var interact_switchlights = false
var interact_gadget = false


# Called when the node enters the scene tree for the first time.
func _ready():
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
	emit_signal("level_changed", "Houses/House2_floor1")

func _on_SwitchLights_body_entered(body):
	interact_switchlights = true
	print("enter switchlights")

func _on_SwitchLights_body_exited(body):
	interact_switchlights = false
	print("exit switchligghts")


func _on_Gadgetgame_body_entered(body):
	interact_gadget = true
	print("enter gagdgetgame")


func _on_Gadgetgame_body_exited(body):
	interact_gadget = false
	print("exit gadgetgaem")



