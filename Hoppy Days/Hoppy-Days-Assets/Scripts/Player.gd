extends KinematicBody2D

var motion = Vector2()

const SPEEED = 750
const GRAVITY = 1000
const UP = Vector2(0, -1)
const JUMP_SPEED = -1000

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)
	
func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
			
func run():
		
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		$AnimatedSprite.flip_h = false
		
		
func jump():
	if Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED