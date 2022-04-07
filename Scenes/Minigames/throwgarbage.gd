extends Node2D

var arrow = null
var object = null
var picked_up = true
var should_reset = false
var score = 0
#vector for throwing speed/angle
var x = 200
var y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	arrow = get_node("Arrow")
	object = get_node("objectToThrow")
	#arrow.hide()
	#self.gravity_scale = 0
	print(object.get_global_position())

func _physics_process(delta):
	arrow.rotation_degrees = (y / PI)
	print(object)
	
	if picked_up == true:
		object.position = get_node("Character/Position2D").position
		object.get_global_position()	#??? without this resetting wont work, I have no idea why
	
	if should_reset == true:
		object.linear_velocity = Vector2(0,0)
		object.angular_velocity = 0.0
		object.set_global_position(Vector2(78,540))
		should_reset = false

func _input(event):
	if Input.is_action_just_pressed("throw_ball"):
		if picked_up == true:
			object.apply_impulse(Vector2(),Vector2(x, y))
		picked_up = false
		print(y)
		arrow.hide()
	if Input.is_action_pressed("aim_down"):
		if y < 50:
			y += 10
	if Input.is_action_pressed("aim_up"):
		if y > -200:
			y -= 10
	
	if Input.is_action_just_pressed("reset_ball"):
		picked_up = true
		should_reset = true
		arrow.show()

func _on_Area2D_body_entered(body):
	print("yeehaw")
	score += 1
	print(score)
	object.queue_free()
	
	spawn_item()

func spawn_item():
	object = get_node("objectToThrow")
	#add_child(object)
	print(object)
	should_reset = false
	picked_up = false
	
