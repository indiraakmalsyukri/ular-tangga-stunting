extends Node2D
#@onready var transition = $transition
#@onready var timer = $Timer
var player_character: String
#var player_id: int
var milage=0
var targetpos=0
var path_follow_2d: float
var current_scene = null
# Called when the node enters the scene tree for the first time.
@onready var mpp: MPPlayer = get_parent() as MPPlayer
var player_progress = 0.0
var player_ready_states: Array = [false, false, false, false]
func _ready():
	# Listen to MultiPlay Player Signals
	#connect("post", Callable(self, "milage1"))
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
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
func milage1():
	#print("milage global ",milage)
	pass
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
func changed_scene():
	pass
func set_player_character(player_character):
	#self.player_id = player_id
	self.player_character = player_character
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path)
	

func _deferred_goto_scene(path):
	
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instantiate()
	
	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
	



