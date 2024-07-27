extends Node2D
signal connected_to_server
signal start_online_host
signal start_online_join
var host =""
@export var player_scene: PackedScene
@onready var address_input = $MarginContainer/VBoxContainer/HBoxContainer/address_input
@onready var host_btn = $MarginContainer/VBoxContainer/HBoxContainer/host
@onready var join_btn = $MarginContainer/VBoxContainer/join
@onready var multi_play_core = $"."
#@export var mpc: MultiPlayCore
@onready var mpc: MPPlayer = get_parent() as MPPlayer
#func _ready():
	## Register Button Press Signals
	#host_btn.pressed.connect(host_game)
	#join_btn.pressed.connect(join_game)
	#print("Parent node type: ", typeof(get_parent()))
	#print("Parent node name: ", get_parent().name)
	## Hide UI if client were connected
	#mpc.connected_to_server.connect(_on_connected_to_server)
func _ready():
	# Ensure the parent is of type MPPlayer
	var parent = get_parent()
	if parent is MPPlayer:
		mpc = parent
	else:
		print("Parent is not of type MPPlayer. Check your scene hierarchy.")
	
	# Register Button Press Signals
	host_btn.pressed.connect(host_game)
	join_btn.pressed.connect(join_game)
	
	if mpc:
		# Hide UI if client were connected
		mpc.connected_to_server.connect(_on_connected_to_server)
	else:
		print("mpc is not initialized. Cannot connect signal.")
	
	address_input.text_changed.connect(_on_address_input_text_changed)
func _on_address_input_text_changed(new_text):
	host=new_text
	print(new_text)
	
func host_game():
	mpc.start_online_host(true)
	print("make room")
	
func join_game():
	mpc.start_online_join(address_input)
	print("join room")

func _on_connected_to_server(_plr):
	get_tree().change_scene_to_file("res://lobby.tscn")
#func _add_player(id=rng.randf):
	#var player = player_scene.instantiate()
	#player.name=str(id)
	#call_deferred("add_child",player)
	#print(host,ip)

# Replace with function body.
