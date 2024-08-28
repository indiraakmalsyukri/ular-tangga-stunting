extends Node2D

var speed =0.1
@onready var navigation_agent_2d = $NavigationAgent2D
@onready var path_2d = $NavigationAgent2D/Path2D
@onready var path_follow_2d = $NavigationAgent2D/Path2D/PathFollow2D
@onready var node_2d = $"."
@onready var marker_2d = $NavigationAgent2D/Path2D/PathFollow2D/Marker2D
@onready var timer = $"../Timer"
var rng=RandomNumberGenerator.new()
var droop= preload("res://droop.tscn")
var num : int
signal droop_scene(droop_scene,location)
var loop = true
# Called when the node enters the scene tree for the first time.
#func _ready():
	#
	#while (loop):
		#rand()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	path_follow_2d.progress_ratio += delta*speed
	
func rand():
	RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(1,100)
	#print(num)
	if num == 1:
		droop_down
func droop_down():
	droop_scene.emit(droop,marker_2d.global_position)
	print("out")

