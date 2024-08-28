class_name collectibles
extends Area2D
signal hit 
func _on_body_entered(body):
	if body is Player:
		queue_free()
		hit.emit()
		print("hit")
