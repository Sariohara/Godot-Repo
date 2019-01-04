extends AnimatedSprite



func _on_Area2D_body_entered(body):
	Global.Gamestate.coin_up()
	$AnimationPlayer.play("die")
	
func die():
	queue_free()
