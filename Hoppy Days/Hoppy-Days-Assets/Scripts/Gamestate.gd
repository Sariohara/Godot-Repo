extends Node2D
	
export var startingLives = 3
var lives
var coins = 0

func _ready():
	Global.Gamestate = self
	lives = startingLives
	update_GUI()
	
func update_GUI():
	Global.GUI.update_GUI(lives)
	
func hurt():
	lives -= 1
	Global.Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()
		
func coin_up():
	coins += 1

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
