extends Node2D

signal player_ready()
signal handshake_ready()
signal swap_focused(old_focus)
signal swap_unfocused(new_focus)

@export_file("*.tscn") var game_scene_path : String
@export var options_packed_scene : PackedScene
@export var credits_packed_scene : PackedScene
@export var version_name : String = '0.0.0'
@onready var player_ip_labels: Array = [
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer2/HBoxContainer/player_1,
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer2/VBoxContainer2/HBoxContainer/player_2,
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer3/HBoxContainer/player_3,
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer4/HBoxContainer/player_4
]
@onready var player_ready_status = $MarginContainer/HBoxContainer/VBoxContainer2/player_ready_status
@onready var mpp: MPPlayer = get_parent() as MPPlayer
var player_ready_states: Array = [false, false, false, false]
func _ready():
	# Listen to MultiPlay Player Signals
	if mpp:
		mpp.player_ready.connect(_on_player_ready)
		mpp.handshake_ready.connect(_on_handshake_ready)
	else:
		print("Error: Parent is not of type 'MPPlayer' or is null.")
		print("Parent node type: ", typeof(get_parent()))
		print("Parent node name: ", get_parent().name)

func _on_player_ready(player_index):
	player_ready_states[player_index] = true
	update_player_ready_status()
	player_ready.emit(player_index)

# Signal callback for handshake_ready
func _on_handshake_ready(hs):
	print(mpp.player_index)
	lobby()
	handshake_ready.emit()
func preload_mp_players_collection() -> MPPlayersCollection:
	var multi_play_core = get_tree().root.get_node("MultiPlayCore")
	if multi_play_core == null:
		print("Error: 'MultiPlayCore' node not found.")
		return null
	return multi_play_core.get_node("MPPlayersCollection") as MPPlayersCollection

func update_player_ready_status():
	for i in range(player_ready_states.size()):
		player_ip_labels[i].text = "ready" if player_ready_states[i] else "not ready"

# Checks if all players are ready
func are_all_players_ready() -> bool:
	for state in player_ready_states:
		if not state:
			return false
	return true
# Sets the lobby status to ready
func lobby():
	for i in range(player_ready_states.size()):
		player_ready_states[i] = true
	update_player_ready_status()





