extends RigidBody2D


var arrow = null
var picked_up = true


#vector for throwing speed/angle
var x = 200
var y = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	arrow = get_parent().get_node("Arrow")
	#arrow.hide()
	#self.gravity_scale = 0

func _physics_process(delta):
	#print(get.parent())
	if picked_up == true:
		self.position = get_parent().get_node("Character/Position2D").position
		
		arrow.rotation_degrees = (y / PI)

func _input(event):
	if Input.is_action_just_pressed("throw_ball"):
		if picked_up == true:
			apply_impulse(Vector2(),Vector2(x, y))
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
		self.linear_velocity = Vector2(0,0)
		arrow.show()

func _on_Area2D_body_entered(body):
	print("yeeyah")
	hide()
