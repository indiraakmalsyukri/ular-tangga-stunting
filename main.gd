extends Node2D
var peer =ENetMultiplayerPeer.new()
var host =""
var ip = 135
@export var player_scene: PackedScene
@onready var address_input = $Control/address_input
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.

func _on_address_input_text_changed(new_text):
	host=new_text
	print(new_text)
	
func _on_host_pressed(id=1):
	peer.create_server (ip)
	peer.create_client(host,ip)
	multiplayer.multiplayer_peer = peer
	_add_player()
	multiplayer.peer_connected.connect(_add_player)
	get_tree().change_scene_to_file("res://lobby.tscn")
	print("make room")
	
func _on_join_pressed():
	peer.create_client(host,ip)
	multiplayer.multiplayer_peer =peer
	print(host,ip)
	get_tree().change_scene_to_file("res://lobby.tscn")
	print("join room")
	
func _add_player(id=rng.randf):
	var player = player_scene.instantiate()
	player.name=str(id)
	call_deferred("add_child",player)
	print(host,ip)

# Replace with function body.
