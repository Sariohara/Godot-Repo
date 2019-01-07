extends AnimatedSprite

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		Global.Gamestate.coin_up()
		$AnimationPlayer.play("die")
		$AudioStreamPlayer.play()
	
func die():
	queue_free()
