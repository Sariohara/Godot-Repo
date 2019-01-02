extends KinematicBody2D

var motion = Vector2()

const SPEEED = 750
const GRAVITY = 3600
const UP = Vector2(0, -1)
const JUMP_SPEED = -1750

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
	
func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
		jump()
			
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
		
		
		