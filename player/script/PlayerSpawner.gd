extends Node2D

# Exported variable to preload the player scene
@onready var player = $player
# Optionally, start progress along the path (default: 0)
@export var start_progress: float = 0.0

# Reference to the spawned player instance
var player_instance: Node = null

# Signal emitted after the player is spawned
signal player_spawned(player: Node)

func _ready() -> void:
	spawn_player()

# Function to spawn the player
func spawn_player() -> void:
	# Ensure the player scene is valid
	if not player:
		print("Player scene is not assigned!")
		return
	
	# Instance the player
	player = player.instantiate()
	
	# Add the player as a child of the spawner (or PathFollow2D if used)
	if "PathFollow2D" in get_parent().get_class():
		get_parent().add_child(player)
		player_instance.position = Vector2.ZERO # Spawn at the center of PathFollow2D
	else:
		add_child(player)
		player_instance.position = position # Spawn at the spawner's position
	
	# If the parent is a PathFollow2D, set progress
	if get_parent().has_method("set_progress"):
		get_parent().set("progress", start_progress)
	
	# Emit a signal indicating the player has been spawned
	emit_signal("player_spawned", player_instance)
	print("Player spawned at position:", player_instance.position)
