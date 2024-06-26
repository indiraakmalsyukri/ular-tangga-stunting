extends Node2D

var player_character: String
#var player_id: int
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func set_player_character(player_character):
	#self.player_id = player_id
	self.player_character = player_character
