extends Node
@onready var path_2d = $"."
@onready var path_follow_2d = $PathFollow2D
@onready var path_follow_2d_2 = $PathFollow2D2
@onready var sprite_2d = $PathFollow2D/Sprite2D
@onready var path_follow_2d_3 = $PathFollow2D3
@onready var path_follow_2d_4 = $PathFollow2D4
@onready var path_follow_2d_5 = $PathFollow2D5
@onready var path_follow_2d_6 = $PathFollow2D6


@export var speed :int
# Assign this variable to MPAuth node
@export var auth: MPAuth

func _ready():
	#path_follow_2d_2.progress=100
	sprite_2d.play()
	
	#auth.authenticate_function = _auth_check
func _process(delta):
	path_follow_2d.progress+=delta*speed
	path_follow_2d_2.progress+=delta*speed
	path_follow_2d_3.progress+=delta*speed
	path_follow_2d_4.progress+=delta*speed
	path_follow_2d_5.progress+=delta*speed
	path_follow_2d_6.progress+=delta*speed
#func _auth_check(plr_id, credentials_data: Dictionary, handshake_data: Dictionary):
	## Return authentication data, otherwise if failed, return false.
	#return {}

