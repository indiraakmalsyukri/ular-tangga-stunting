extends CharacterBody2D

#@onready var mpp: MPPlayer = get_parent()
@export var speed : int
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _enter_tree():
	##set_multiplayer_authority(name.to_int())
	##rich_text_label=(set_multiplayer_authority)
	##print(name)
func _physics_process(delta):
	#if not is_on_floor():
	velocity.y += speed * delta
	#if is_multiplayer_authority():
		#velocity=Input.get_vector("ui_left","ui_right","ui_up","ui_down")*100
	#move_and_slide()
	
