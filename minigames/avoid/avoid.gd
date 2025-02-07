extends Node2D

@export var enemy_type:Array[PackedScene]=[]
@onready var enemy_spawner = $"enemy spawner"
@export var speed : int
@export var scroll_speed =100
@onready var timer = $Timer
@onready var PB = $ParallaxBackground
@export var score_n:int
@export var milage :int
@export var milage1 :int
@export var targetpos:int
@export var targetpos1:int
@onready var label_2 = $HBoxContainer/VBoxContainer/Label2
@onready var label = $HBoxContainer/VBoxContainer/Label
const DROOP = preload("res://droop.tscn")
var score=0
func _ready():
	timer.timeout.connect(_on_timer_timeout)
	label.text = "score: %s" % score_n
	#label_2.text = "hidup yang tersisa : %s" % score_n
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
	score_n -= 1
	label.text = "score: %s" % score_n
	print(score)
	if score_n==-1:
		back_scene()
func _on_timer_2_timeout():
	back_scene()
func back_scene():
	var sc=score_n*-1
	if score <score_n:
		Global.milage=milage
		Global.targetpos =targetpos
		Global.goto_scene("res://map.tscn")
	else:
		Global.milage=milage1
		Global.targetpos =targetpos1
		Global.goto_scene("res://map.tscn")
