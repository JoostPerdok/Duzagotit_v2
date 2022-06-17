extends Node2D

signal level_changed(next_level_name)

var player
var can_pickup_sock = false
var can_pickup_pen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if "sock" in Global.player_inventory or "rubbish_friend" in Global.player_inventory:
		$Sock.hide()
	if "pen" in Global.player_inventory or "rubbish_friend" in Global.player_inventory:
		$Pen.hide()


func _on_Stairs_body_entered(body):
	emit_signal("level_changed", "Houses/House1_floor2")


func _process(delta):
	if Input.is_action_pressed("ui_accept") and can_pickup_sock == true:
		$AnimationPlayer.play("pickup_sock")
		yield(get_node("AnimationPlayer"), "animation_finished")
		Global.player_inventory.append("sock")
	if Input.is_action_pressed("ui_accept") and can_pickup_pen == true:
		$AnimationPlayer.play("pickup_pen")
		yield(get_node("AnimationPlayer"), "animation_finished")
		Global.player_inventory.append("pen")


func _on_Frontdoor_body_entered(body):
	$DoorSlam.play()
	yield($DoorSlam, "finished")
	emit_signal("level_changed", "HouseSelect")


func _on_Sock_body_entered(body):
	if body == $Player:
		can_pickup_sock = true
	


func _on_Sock_body_exited(body):
	if body == $Player:
		can_pickup_sock = false
	


func _on_Pen_body_entered(body):
	if body == $Player:
		can_pickup_pen = true
		


func _on_Pen_body_exited(body):
	if body == $Player:
		can_pickup_pen = false
	


func _on_Area2D2_body_entered(body):
	pass # Replace with function body.


func _on_Toilet_body_entered(body):
	$Toilet/ToiletFlush.play()
