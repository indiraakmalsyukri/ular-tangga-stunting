extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var dadu = $dadu
@onready var node_2d = $"."
@onready var sprite_2d = $NavigationAgent2D/Path2D/PathFollow2D/CharacterBody2D/Sprite2D
@onready var marker_2d = $NavigationAgent2D/Path2D/PathFollow2D/Marker2D
@onready var path_follow_2d = $NavigationAgent2D/Path2D/PathFollow2D
@onready var path_2d = $NavigationAgent2D/Path2D
#j 
var char=" "
var currentpos = 0
var speed = 1
var step : int
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
var player
#@onready var mpp: MPPlayer = get_parent()
func _ready():
	
	## Listen to MultiPlay Player Signals
	#mpp.player_ready.connect(_on_player_ready)
	#mpp.handshake_ready.connect(_on_handshake_ready)
	#mpp.swap_focused.connect(_on_swap_focused)
	#mpp.swap_unfocused.connect(_on_swap_unfocused)
	get_multiplayer_authority()
	get_player_character()
	var player_ins =player.instantiate()
	add_child(player_ins)
	player_ins.position = path_follow_2d.position
func _process(delta):
	pass

func _on_swap_focused(_old_focus):
	$SwapIndicator.visible = true
	$Camera2D.enabled = true

# When swap mode unfocused on this player
func _on_swap_unfocused(_new_focus):
	$SwapIndicator.visible = false
	$Camera2D.enabled = false


# When player node is ready, this only emit locally.

func get_player_character():
	match Global.player_character:
		"char 1":
			player = load("res://character/char_1.tscn")
		"char 2":
			player = load("res://character/char_2.tscn")
		"char 3":
			player = load("res://character/char_3.tscn")
		"char 4":
			player = load("res://character/char_4.tscn")
		_:
			player = load("res://character/char_4.tscn")

func _on_dadu_pressed():
	animated_sprite_2d.play("dice")
	animated_sprite_2d.stop()
	animated_sprite_2d.hide()
	RandomNumberGenerator.new()
	rng.randomize()
	var dicenumber = 6#rng.randi_range(1, 6)
	step = dicenumber
	animated_sprite_2d.set_frame(dicenumber-1)
	animated_sprite_2d.show()
	move()
	print("buton pressed",dicenumber)
	pass # Replace with function body.

func move() -> void:
	var walk=step*45
	var targetpos = path_follow_2d.progress + walk
	var tween = create_tween()
	tween.tween_property(path_follow_2d, "progress", targetpos, speed)
	print ("targetpos",targetpos,"step",step,walk)
	checkwin()
func checkwin():
	if currentpos>=36:
		print ("win")

