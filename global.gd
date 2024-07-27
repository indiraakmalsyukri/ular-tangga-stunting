extends Node2D

var player_character: String
#var player_id: int

# Called when the node enters the scene tree for the first time.
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

# Signal callback for handshake_ready
func _on_handshake_ready(hs):
	print(mpp.player_index)
func preload_mp_players_collection() -> MPPlayersCollection:
	var multi_play_core = get_tree().root.get_node("MultiPlayCore")
	if multi_play_core == null:
		print("Error: 'MultiPlayCore' node not found.")
		return null
	return multi_play_core.get_node("MPPlayersCollection") as MPPlayersCollection
func _process(delta):
	pass
func set_player_character(player_character):
	#self.player_id = player_id
	self.player_character = player_character
