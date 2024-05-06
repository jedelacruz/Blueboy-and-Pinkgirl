extends Area2D


func _on_area_entered(area):
	if area.name == "Hurtbox":
		Global.collectibleScore += 1
		print("Score: " + str(Global.collectibleScore))
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(.2).timeout
		queue_free()
