extends Control
@onready var choice_2 = $HBoxContainer/VBoxContainer/HBoxContainer/choice2
@onready var choice = $HBoxContainer/VBoxContainer/HBoxContainer/choice
@export var targetpos : int
@export var targetpos1 : int
@export var milage :int
@export var milage1 :int

#func _ready():
	#if choice == true:
		#_on_correct()
	#else:
		#_on_incorrect()
		
func _on_choice_2_correct():
	_on_correct()
func _on_choice_incorrect():
	_on_incorrect()
func _on_choice_correct():
	_on_correct()
func _on_choice_2_incorrect():
	_on_incorrect()

func  _on_correct():
	Global.targetpos = targetpos
	Global.milage =milage
	print("correct")
	Global.goto_scene("res://map.tscn")
func  _on_incorrect():
	Global.milage =milage1
	Global.targetpos = targetpos1
	print("incorect")
	Global.goto_scene("res://map.tscn")


