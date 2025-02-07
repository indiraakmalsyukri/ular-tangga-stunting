extends Node

# Assign this variable to MPAuth node
@export var auth: MPAuth
@onready var front_snake = $"."
@onready var path_follow_2d = $PathFollow2D
const speed=1
#func _ready():
	#auth.authenticate_function = _auth_check

#func _auth_check(plr_id, credentials_data: Dictionary, handshake_data: Dictionary):
	## Return authentication data, otherwise if failed, return false.
	#return {}
func _process(delta):
	path_follow_2d.progress=delta+speed

