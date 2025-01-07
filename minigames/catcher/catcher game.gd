extends Node2D

@export var enemy_type:Array[PackedScene]=[]
@onready var enemy_spawner = $"enemy spawner"
@export var speed : int
@export var scroll_speed =100
@onready var timer = $Timer
@export var sprite_2d: Sprite2D
@export var score_n:int
@export var targetpos:int
@export var targetpos1:int
@onready var PB = $ParallaxBackground
@onready var timer_2 = $Timer2
@export var milage :int
@export var milage1 :int
const DROOP = preload("res://droop.tscn")
var score=0
func _ready():
	timer.timeout.connect(_on_timer_timeout)
	#enemy_spawner.hit.connect(_on_droop_hit)
func _process(delta):
	PB.scroll_offset.y += delta*scroll_speed
	#if score = 10
		#scene_file_path
func _on_timer_timeout():
	var e = enemy_type.pick_random().instantiate()
	e.global_position=Vector2(randf_range(50,1140),10)
	e.connect("hit", Callable(self, "_on_droop_hit"))
	enemy_spawner.add_child(e)
func _on_droop_hit():
	score += 1
	print(score)
func _on_timer_2_timeout():
	back_scene()
func back_scene():
	if score >score_n:
		print("win")
		Global.milage =milage
		Global.targetpos >=targetpos
		Global.goto_scene("res://map.tscn")
	else:
		print("lose")
		Global.milage = milage1
		Global.targetpos =targetpos1
		Global.goto_scene("res://map.tscn")
