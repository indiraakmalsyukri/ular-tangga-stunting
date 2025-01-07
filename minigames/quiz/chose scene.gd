extends Control
@onready var choice_2 = $HBoxContainer/VBoxContainer/HBoxContainer/choice2
@onready var choice = $HBoxContainer/VBoxContainer/HBoxContainer/choice
@export var targetpos : int
@export var milage :int
@export var milage1 :int

func _ready():
	choice_2.connect("correct", Callable(self, "_on_correct"))
	choice_2.connect("incorrect", Callable(self, "_on_incorrect"))
	choice.connect("correct", Callable(self, "_on_correct"))
	choice.connect("incorrect", Callable(self, "_on_incorrect"))
func  _on_correct():
	Global.targetpos = targetpos
	print("correct")
	Global.goto_scene("res://map.tscn")
func  _on_incorrect():
	print("incorect")
	Global.goto_scene("res://map.tscn")
