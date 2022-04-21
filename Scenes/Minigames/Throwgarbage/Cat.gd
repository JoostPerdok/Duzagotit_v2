extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("hiss")


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "default":
		$AnimatedSprite.play("default")
