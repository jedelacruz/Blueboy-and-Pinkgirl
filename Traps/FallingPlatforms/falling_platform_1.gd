extends CharacterBody2D

@onready var animated_sprite_2d = $Area2D/AnimatedSprite2D
@onready var timer = $Timer

var initial_falling_speed = 400
var acceleration = 50
var max_falling_speed = 900
var timeout_finished = false

func _process(delta):
	if timeout_finished:
		var current_falling_speed = min(initial_falling_speed + acceleration * delta, max_falling_speed)
		position.y += current_falling_speed * delta
		if position.y >= 2000: 
			queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "Hurtbox":
		print(":asasdas")
		animated_sprite_2d.play("ON")
		timer.start()

func _on_timer_timeout():
	timeout_finished = true
