extends CharacterBody2D

@onready var animated_sprite_2d = $Area2D/AnimatedSprite2D

@export var force = -500

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player1 or area.get_parent() is Player2:
		animated_sprite_2d.play("jump")
		area.get_parent().velocity.y = force

