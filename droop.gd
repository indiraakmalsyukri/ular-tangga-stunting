class_name enemy
extends Node2D
signal hit
@export var speed : int
func _physics_process(delta):
	global_position.y += speed * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

#func _on_area_entered(area):
	#if area is Player:
		#print("hit")

func _on_body_entered(body):
	if body is Player:
		hit.emit()
		queue_free()


	
