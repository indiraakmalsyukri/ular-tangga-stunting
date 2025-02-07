class_name Player
extends CharacterBody2D
#@onready var animation_tree = $Control/AnimationTree
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var path_follow_2d = $vertical/PathFollow2D
@onready var horizon = $vertical/PathFollow2D/horiz/horizon


@export var collision=false
@onready var verticals = $vertical
@onready var right_eye = $"vertical/PathFollow2D/horiz/horizon/right eye"
@onready var left_eye = $"vertical/PathFollow2D/horiz/horizon/left eye"

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var anima : float
@export var speed : int
@export var JUMP_VELOCITY:int
@export var jump=false
var char=" "
var player
var milage: int
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Get the MultiPlay Player node, It's the parent of this node!
#@onready var mpp: MPPlayer = get_parent()
#@onready var map = get_tree().get_root().get_node("player")
func _ready():
	# Listen to MultiPlay Player Signals
	#mpp.player_ready.connect(_on_player_ready)
	#mpp.handshake_ready.connect(_on_handshake_ready)
	#mpp.swap_focused.connect(_on_swap_focused)
	#mpp.swap_unfocused.connect(_on_swap_unfocused)
	#set_multiplayer_authority(name.to_int())
	#anim_player.play("idle")
	#animation()
	get_player_character()
	var player_ins =player.instantiate()
	add_child(player_ins)
	print("player",get_tree(),get_children())
	right_eye.set_frame(2)
	left_eye.set_frame(2)
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
# When swap mode focused on this player
func _physics_process(delta):
		
	if collision == true :
		visible_on_screen_notifier_2d
	else:
		pass
	# Add the gravity.
	if jump == true:
		if not is_on_floor():
			velocity.y += gravity * delta
			right_eye.set_frame(2)
			left_eye.set_frame(2)
		## Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y -= JUMP_VELOCITY
		
	else:
		
		pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		path_follow_2d.progress_ratio+=anima*delta
	#else:
	if direction>=1:
		horizon.progress_ratio=0.2
	if direction<=-1:
		horizon.progress_ratio=0.1
	if direction==0:
		right_eye.play()
		left_eye.play()
		horizon.progress_ratio=0.1359
	#right_eye.autoplay
	#left_eye.autoplay
	
	

	move_and_slide()
#func idle():
	
	
#func _on_swap_focused(_old_focus):
	#$SwapIndicator.visible = true
	#$Camera2D.enabled = true
#
## When swap mode unfocused on this player
#func _on_swap_unfocused(_new_focus):
	#$SwapIndicator.visible = false
	#$Camera2D.enabled = false
#
#
## When player node is ready, this only emit locally.
#func _on_player_ready():
	#print("Player's now ready!")
	
	# We'll need to enable camera only when focused on swap mode
	#if mpp.mpc.mode != mpp.mpc.PlayMode.Swap:
		#$Camera2D.enabled = true
	
	# Spawn position, had to change so they doesn't spawn at the same position

# On handshake data is ready. This emits to everyone in the server. You can also use it to init something for all players.
#func _on_handshake_ready(hs):
	#print(mpp.player_index)
	#$PlayerLabel.text = "P" + str(mpp.player_index + 1)
#func _physics_process(delta):
	#if is_multiplayer_authority():
		#velocity=Input.get_vector("ui_left","ui_right","ui_up","ui_down")*100
		#move_and_slide()
	
