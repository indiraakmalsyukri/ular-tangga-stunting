extends Node2D
var score = 0

func _on_collectibles_hit():
	score += 1
	print(score)
	if score == 4:
		back_scene()
func back_scene():
	Global.goto_scene("res://map.tscn")
	
