extends Node2D

signal level_changed(next_level_name)

var player
var interact_wardrobe = false
var interact_garbage = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$House/WardrobeGame/WardrobeHighlight.hide()
	$Player.position = Global.player_position
	pass


func _on_Stairs_body_entered(body):
	emit_signal("level_changed", "Houses/House1_floor1")


func _process(delta):
	if Input.is_action_pressed("ui_accept") and interact_wardrobe == true:
		Global.player_position = $Player.position
		emit_signal("level_changed", "Minigames/Tshirt/TshirtLevel1")
	
	if Input.is_action_pressed("ui_accept") and interact_garbage == true:
		Global.player_position = $Player.position
		emit_signal("level_changed", "Minigames/Throwgarbage/throwgarbage")


func _on_WardrobeGame_body_entered(body):
	if body == $Player:
		$House/WardrobeGame/WardrobeHighlight.show()
		interact_wardrobe = true

func _on_WardrobeGame_body_exited(body):
	if body == $Player:
		$House/WardrobeGame/WardrobeHighlight.hide()
		interact_wardrobe = false


func _on_ThrowGarbageGame_body_entered(body):
	if body == $Player:
		$House/ThrowGarbageGame/GarbageHighlight.show()
		interact_garbage = true

func _on_ThrowGarbageGame_body_exited(body):
	if body == $Player:
		$House/ThrowGarbageGame/GarbageHighlight.hide()
		interact_garbage = false
