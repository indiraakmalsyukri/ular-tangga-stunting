extends Node
@onready var timer = $"../Timer"
@export var enemy_type:Array[PackedScene]=[]
@onready var enemy_spawner = $"."
@export var speed : int

func _on_timer_timeout():
	var e= enemy_type.pick_random().instantiate()
	e.global_position=Vector2(100,10)
	enemy_spawner.add_child(e)

