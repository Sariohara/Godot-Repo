extends Area2D

func _ready():
	Global.Gamestate = self

func _on_body_entered(body):
	Global.Gamestate.hurt()
