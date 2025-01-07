extends Node2D
var score = 0
@export var targetpos:int
@export var milage :int
@export var milage1 :int
func _on_collectibles_hit():
	score += 1
	print(score)
	if score == 4:
		back_scene()
func back_scene():
	Global.targetpos =targetpos
	Global.goto_scene("res://map.tscn")
	
