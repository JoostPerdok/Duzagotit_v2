extends Node2D

onready var current_level = $Titlescreen
var current_level_name = "Titlescreen"

func _ready():
	current_level.connect("level_changed", self, "handle_level_changed")
	current_level.connect("ask_question", self, "handle_ask_question")

func handle_level_changed(next_level_name: String):
	var next_level = load("res://Scenes/" + next_level_name + ".tscn").instance()
	#print(current_level, next_level, next_level_name)
	call_deferred("add_child", next_level)
	next_level.connect("level_changed", self, "handle_level_changed")
	next_level.connect("ask_question", self, "handle_ask_question")
	next_level.connect("update_score", get_parent(), "handle_update_score")
	current_level.queue_free()
	current_level = next_level
	current_level_name = next_level_name

func handle_ask_question(next_level_name: String):
	print("asking question")
	current_level.modulate = '#404040'	#grayout background
	var grumpy = load("res://Scenes/GrumpyQuestion.tscn").instance()
	add_child(grumpy)
	grumpy.connect("level_changed", self, "handle_level_changed")
	grumpy.connect("ask_question", self, "handle_ask_question")
	grumpy.next_level = next_level_name
