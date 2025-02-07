extends Node2D
var score = 0
@export var targetpos:int
@export var targetpos1:int
@export var milage :int
@export var milage1 :int
@export var score_n:int
@onready var timer = $Timer
@onready var label_2 = $PlayerSpawner/player/Camera2D/HBoxContainer/VBoxContainer/Label2
@onready var label = $PlayerSpawner/player/Camera2D/HBoxContainer/VBoxContainer/Label

func _ready():
	label.text = "score: %s" % score
	label_2.text = "score yang diperlukan : %s" % score_n
func _on_collectibles_hit():
	score += 1
	label.text = "score: %s" % score
	print(score)
	if score == 4:
		back_scene()
func on_timer_timeout():
	back_scene()
func back_scene():
	if score == 4:
		Global.targetpos =targetpos
		Global.milage = milage
		Global.goto_scene("res://map.tscn")
	else :
		Global.targetpos =targetpos1
		Global.milage = milage1
		Global.goto_scene("res://map.tscn")
	
