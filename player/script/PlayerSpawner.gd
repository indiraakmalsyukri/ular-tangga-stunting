
extends Node

# Assign this variable to MPAuth node
@export var auth: MPAuth
@export var Player:PackedScene
@export var position:Vector2= Vector2.ZERO
func _auth_check(plr_id, credentials_data: Dictionary, handshake_data: Dictionary):
	# Return authentication data, otherwise if failed, return false.
	return {}
func _ready():
	SpawnPlayer()
	
func SpawnPlayer():
	var play=Player.instantiate()
	play.position=position
	get_parent().add_child(play)
	play=Player
	pass
