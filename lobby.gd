extends Control

signal player_ready
signal handshake_ready
signal swap_focused(old_focus)
signal swap_unfocused(new_focus)
@export_file("*.tscn") var game_scene_path : String
@export var options_packed_scene : PackedScene
@export var credits_packed_scene : PackedScene
@export var version_name : String = '0.0.0'
#var player_index = 0
#@onready var mp_players_collection = get_tree().get_root().get_node("mp_players_collection")
@onready var multi_play_core = $"."
#@onready var mp_players_collection = $MPPlayersCollection
#@onready var mp_player = $MPPlayer
#@onready var mp_players_collection =  $"."/MPPlayersCollection
#@onready var mpp= get_parent()
const MpPlayer = preload("res://addons/MultiplayCore/MPPlayer.gd")
var options_scene
var credits_scene
var sub_menu
@onready var mpp: MPPlayer = get_parent()
#@onready var multi_play_core = $"."
@onready var player_ip__1 = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer2/HBoxContainer/player_1
@onready var player_ip__2 = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer2/VBoxContainer2/HBoxContainer/player_2
@onready var player_ip__3 = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer3/HBoxContainer/player_3
@onready var player_ip__4 = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer4/HBoxContainer/player_4


func _ready():
	print("Game started, printing tree for debugging:")
	get_tree().root.print_tree()
	preload_mp_players_collection()
	mpp.player_ready.connect(_on_player_ready)
	mpp.handshake_ready.connect(_on_handshake_ready)
	mpp.swap_focused.connect(_on_swap_focused)
	mpp.swap_unfocused.connect(_on_swap_unfocused)
func preload_mp_players_collection() -> Node:
	var node = multi_play_core.get_node("$MPPlayer")
	if node == null:
		print("Error: 'mpp' node not found.")
		get_parent().print_tree()
	return node

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
	if mpp.mpc.mode != mpp.mpc.PlayMode.Swap:
		$Camera2D.enabled = true
	
	# Spawn position, had to change so they doesn't spawn at the same position
	position = Vector2(mpp.player_index * 50,0)

# On handshake data is ready. This emits to everyone in the server. You can also use it to init something for all players.
func _on_handshake_ready(hs):
	print(mpp.player_index)
	$PlayerLabel.text = "P" + str(mpp.player_index + 1)

func get_player_by_index(index: int) -> String:
	match index:
		1:
			return player_ip__1.text
		2:
			return player_ip__2.text
		3:
			return player_ip__3.text
		4:
			return player_ip__4.text
		_:
			return "Invalid index"
			
func set_player_ip(index: int, ip: String):
	match index:
		1:
			player_ip__1.text = ip
		2:
			player_ip__2.text = ip
		3:
			player_ip__3.text = ip
		4:
			player_ip__4.text = ip
		_:
			print("Invalid index")
	get_multiplayer().peer.get_connection_status()
