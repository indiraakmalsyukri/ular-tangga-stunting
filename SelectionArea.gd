extends Node

# Assign this variable to MPAuth node
@onready var character = get_parent()
@onready var selection_scene = get_tree().get_root().get_node("character select")
signal character_select

func _ready()-> void:
	#if is_multiplayer_authority():
		get_parent().print_tree()
		connect("character_select",selection_scene.character_selected)
func hide_selection():
	$selection.hide()
func _on_input_event(viewport, event,int):
	if event.is_action_pressed("left click"):
		print("button",character.name)
		emit_signal("character_select",character.name)
		$selection.show()# Replace with function body.
