extends Node2D

signal level_changed
signal ask_question

var arrow = null
var object = null
var picked_up = true
var should_reset = false
var score = 0
#vector for throwing speed/angle
var x = 600
var y = 0

const MAX_SCORE = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	arrow = get_node("Arrow")
	arrow.hide()
	spawn_item()
	$HUD.update_score(score)
	$HUD.show_message("Throw the garbage in the bin!")

func _physics_process(delta):
	arrow.rotation_degrees = (y / PI)
	
	
	if picked_up == true:
		#print(get_node("Character/Position2D").global_position)
		object.linear_velocity = Vector2(0,0)
		object.angular_velocity = 0.0
		object.set_global_position(Vector2(85,809))
		object.get_global_position()	#??? without this resetting wont work, I have no idea why
	
	if should_reset == true:
		object.linear_velocity = Vector2(0,0)
		object.angular_velocity = 0.0
		object.set_global_position(Vector2(85,809))
		#object.set_global_position(Vector2(360,400))
		should_reset = false

func _input(event):
	if Input.is_action_just_pressed("throw_ball"):
		if picked_up == true:
			object.apply_impulse(Vector2(),Vector2(x, y*5))
		picked_up = false
		print(y)
		arrow.hide()
	
	if Input.is_action_pressed("aim_down"):
		if y < 50:
			y += 5
	if Input.is_action_pressed("aim_up"):
		if y > -200:
			y -= 5
	
	if Input.is_action_just_pressed("reset_ball"):
		picked_up = true
		should_reset = true
		arrow.show()

func _on_Area2D_body_entered(body):
	$HUD.show_message("You Scored!")
	score += 1
	object.queue_free()
	
	$HUD.update_score(score)
	if score == MAX_SCORE:
		end_game()
	else:
		spawn_item()

func spawn_item():
	object = preload("res://Scenes/Minigames/Throwgarbage/ThrowableObject.tscn").instance()
	add_child(object)
	object.gravity_scale = 2.5
	object.bounce = 0.2
	should_reset = false
	picked_up = true
	arrow.show()
	

func end_game():
	$HUD.show_message("Well Done! Your room is now cleaned up!")
	$End_game.start()
	#queue_free()


func _on_End_game_timeout():
	emit_signal("ask_question", "Houses/House1")
	#emit_signal("level_changed", "Houses/House1")


func _on_Node2D_ready():
	print("test ready")
