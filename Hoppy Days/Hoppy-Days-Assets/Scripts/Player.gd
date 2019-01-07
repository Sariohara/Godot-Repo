extends KinematicBody2D

var motion = Vector2()

const SPEEED = 750
const GRAVITY = 3600
const UP = Vector2(0, -1)
const JUMP_SPEED = -1750
const JUMP_BOOST = 2

export var world_limit = 3000

func _ready():
	Global.Player = self

func _physics_process(delta):
	update_Motion(delta)
	
func update_Motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)
	
func _process(delta):
	update_Animation(motion)
	
func update_Animation(motion):
	$AnimatedSprite.update(motion)
	
func hurt():
	motion.y = JUMP_SPEED
		
	
func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
		jump()
		
	if position.y > world_limit:
		Global.Gamestate.end_game()
			
func run():
		
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEEED
	else:
		motion.x = 0
		
		
func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED
		Global.jump_sfx.play()
		
func boost():
	motion.y = JUMP_SPEED * JUMP_BOOST
	