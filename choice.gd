extends Button
var answer :bool
signal correct
signal incorrect 
func _on_pressed():
	if answer == true :
		correct.emit()
	else:
		incorrect.emit()
		
