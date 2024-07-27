extends Node2D

#@onready var animated_sprite_2d = $AnimatedSprite2D
#@onready var dadu = $dadu
@onready var dadu = $Control/Container/dadu
@onready var node_2d = $"."
@onready var sprite_2d = $NavigationAgent2D/Path2D/PathFollow2D/CharacterBody2D/Sprite2D
@onready var marker_2d = $NavigationAgent2D/Path2D/PathFollow2D/Marker2D
@onready var path_follow_2d = $NavigationAgent2D/Path2D/PathFollow2D
@onready var path_2d = $NavigationAgent2D/Path2D
@onready var player = $NavigationAgent2D/Path2D/PathFollow2D/CharacterBody2D/player
@onready var animated_sprite_2d = $Control/Container/AnimatedSprite2D
var player_scene = preload("res://Player.tscn")
#@onready var multi_play_core = "res://multi_play_core.tscn"
#@onready var mpp: MPPlayer = get_node("res://multi_play_core.tscn")
#@onready var mpp: MPPlayer = get_parent()
@export var far : int
@onready var multiplayer_synchronizer = $NavigationAgent2D/Path2D/PathFollow2D/CharacterBody2D/player
var currentpos = 0
var targetpos:int
var speed = 1
var step : int
var rng = RandomNumberGenerator.new()
var milage=0
var backs: int
#@onready var map = get_tree().get_root().get_node("player2")
# Called when the node enters the scene tree for the first time.
#var player
#@onready var mpp: MPPlayer = get_parent()
#@onready var map = $NavigationAgent2D/Path2D/PathFollow2D/CharacterBody2D/MultiplayerSpawner
func _ready():
	## Listen to MultiPlay Player Signals
	#mpp.player_ready.connect(_on_player_ready)
	#mpp.handshake_ready.connect(_on_handshake_ready)
	#mpp.swap_focused.connect(_on_swap_focused)
	#mpp.swap_unfocused.connect(_on_swap_unfocused)
	get_multiplayer_authority()
	#get_player_character()
	#var player_ins =player.instantiate()
	#add_child(player_ins)
	#player_ins.position = path_follow_2d.position
	#player.position = path_follow_2d.position
	#dadu.pressed.connect(_on_dadu_pressed)
	#position = path_follow_2d.position

func _on_swap_focused(_old_focus):
	$SwapIndicator.visible = true
	$Camera2D.enabled = true

# When swap mode unfocused on this player
func _on_swap_unfocused(_new_focus):
	$SwapIndicator.visible = false
	$Camera2D.enabled = false


# When player node is ready, this only emit locally.
func _on_player_ready():
	print("Player's now ready!")
	
	# We'll need to enable camera only when focused on swap mode
	
	# Spawn position, had to change so they doesn't spawn at the same position
	#position = Vector2(mpp.path_follow_2d)

# On handshake data is ready. This emits to everyone in the server. You can also use it to init something for all players.
func _on_handshake_ready(hs):
	#print(mpp.player_index)
	pass
func _physics_process(delta):
	#if !mpp.is_ready:
		return
func _process(delta):
	#dadu.pressed.connect(self,_on_dadu_pressed)
	pass

# When player node is ready, this only emit locally.


#func get_player_character():
	#match Global.player_character:
		#"char 1":
			#player = load("res://character/char_1.tscn")
		#"char 2":
			#player = load("res://character/char_2.tscn")
		#"char 3":
			#player = load("res://character/char_3.tscn")
		#"char 4":
			#player = load("res://character/char_4.tscn")
		#_:
			#player = load("res://character/char_4.tscn")

func _on_dadu_pressed():
	animated_sprite_2d.play("dice")
	animated_sprite_2d.stop()
	animated_sprite_2d.hide()
	RandomNumberGenerator.new()
	rng.randomize()
	var dicenumber = 1#rng.randi_range(1, 6)
	step = dicenumber
	animated_sprite_2d.set_frame(dicenumber-1)
	animated_sprite_2d.show()
	move()
	print("buton pressed",dicenumber)
	pass # Replace with function body.

func move() -> void:
	var walk=step*far
	targetpos = path_follow_2d.progress + walk
	milage= step+milage
	match milage:
		3:
			targetpos = 735
		4:
			targetpos = 525
		9:
			targetpos = 105
		3:
			targetpos = 875
		7:
			targetpos = 1015
		16:
			targetpos=1120
		23:
			targetpos=385
		24:
			targetpos=770
		27:
			targetpos=1155
		35:
			targetpos=210
			#corection
		4:
			targetpos=145
		6:
			targetpos=210
		11:
			targetpos=390
		17:
			targetpos=605
		18:
			targetpos=630
		23:
			targetpos=810
		
	milage=milage-backs
	var tween = create_tween()
	tween.tween_property(path_follow_2d, "progress", targetpos, speed)
	print ("targetpos",targetpos,"step",step,"walk",walk,"milage",milage)
	checkwin()
	#var walk = step * 45
	#var targetpos = path_follow_2d.progress + walk
	#var tween = create_tween()
	#tween.tween_property(path_follow_2d, "progress", targetpos, speed)
	#currentpos += step
	#print("Target position:", targetpos, "Step:", step, "Walk:", walk)
	#checkwin()
func checkwin():
	if currentpos>=36:
		print ("win")



