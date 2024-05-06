extends CharacterBody2D

class_name Player2

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const MAX_JUMPS = 2
var jumps_left = MAX_JUMPS
var has_double_jumped = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if Global.playerHealths <= 0:
		playerdie()
		return

	if Input.is_action_just_pressed("player2Left"):
		animated_sprite.scale.x = abs(animated_sprite.scale.x) * -1
	
	if Input.is_action_just_pressed("player2Right"):
		animated_sprite.scale.x = abs(animated_sprite.scale.x)
		
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("player2Up") and (is_on_floor() or jumps_left > 0):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y = JUMP_VELOCITY * .75
		if jumps_left == 1 and not has_double_jumped:
			has_double_jumped = true
		jumps_left -= 1

	var direction = Input.get_axis("player2Left", "player2Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animation()

	
func update_animation():
	if Global.playerHealths <= 0:
		playerdie()
		return

	if velocity.y < 0:
		animated_sprite.play("jump")
	elif velocity.y > 0:
		animated_sprite.play("fall") 
	elif velocity.x != 0:
		animated_sprite.play("move")
	else:
		animated_sprite.play("idle")

	if is_on_floor():
		jumps_left = MAX_JUMPS
		has_double_jumped = false 

func playerdie():
	animated_sprite.play("die")
	await get_tree().create_timer(1).timeout
	queue_free()
	Global.reloadSceneWhenDie += 1


