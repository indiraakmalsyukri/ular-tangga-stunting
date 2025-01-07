extends Node2D

var current_selected_character_name
var selection_area =preload("character/selection_area.tscn")
@onready var character_select = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().print_tree()
	for character in $character.get_children():
		var selection_area_ins = selection_area.instantiate()
		character.add_child(selection_area_ins)
	

func character_selected(character_name):
	current_selected_character_name = character_name
	$character_label.text = current_selected_character_name
	for character in $character.get_children():
		character.get_child(character.get_child_count()-1).hide_selection

func _on_button_pressed():
	if current_selected_character_name:
		Global.set_player_character (current_selected_character_name)
		Global.goto_scene("res://map.tscn")
