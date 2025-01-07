extends Button
@export var answer :bool
signal correct
signal incorrect 
func _on_pressed():
	if answer == true :
		correct.emit()
		#emit_signal("correct")
		print("choice correct")
	else:
		print("choice incorrect")
		incorrect.emit()
		#emit_signal("incorrect")
