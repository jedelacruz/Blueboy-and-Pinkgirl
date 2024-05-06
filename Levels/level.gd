extends Node2D

func _ready():
	pass

func _physics_process(_delta):
	if Global.reloadSceneWhenDie >= 1:
		get_tree().reload_current_scene()
		Global.reloadSceneWhenDie = 0
		Global.playerHealths = 90
