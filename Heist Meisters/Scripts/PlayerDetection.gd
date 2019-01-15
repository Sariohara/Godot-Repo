extends "res://Scripts/Character.gd"

const FOV_TOLORENCE = 35
const RED = Color(1, .25, .25)
const WHITE = Color(1, 1, 1)

#var random_color = Color(rand_range(0, 1), rand_range(0, 1), rand_range(0, 1))

onready var Player = get_node("/root/Level1/Player")

func _physics_process(delta):
	if Player_is_in_FOV_TOLORENCE() and is_player_in_LOS():
		$Torch.color = RED
#		$Torch.color = random_color
	else:
		$Torch.color = WHITE


func Player_is_in_FOV_TOLORENCE():
	var NPC_face_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_player = (Player.position - global_position).normalized()
	
	if abs(direction_to_player.angle_to(NPC_face_direction)) < deg2rad(FOV_TOLORENCE):
		return true
	else:
		return false
		
		
#LOS(Line of Sight) detection
func is_player_in_LOS():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	
	if LOS_obstacle.collider == Player:
		return true
	else:
		return false
		
		
		
		
		
		
		