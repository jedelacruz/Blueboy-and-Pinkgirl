extends Area2D

#get_tree().change_scene_to_file.bind("res://Levels/level_2.tscn").call_deferred()

var player1_inside = false
var player2_inside = false

func _on_area_entered(area):
	if area.get_parent() is Player2:
		player2_inside = true
	if area.get_parent() is Player1:
		player1_inside = true

	if player1_inside and player2_inside:
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file.bind("res://Levels/level_4.tscn").call_deferred()

func _on_area_exited(area):
	if area.get_parent() is Player2:
		player2_inside = false
	if area.get_parent() is Player1:
		player1_inside = false
