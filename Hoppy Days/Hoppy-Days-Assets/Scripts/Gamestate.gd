extends Node2D
	
export var startingLives = 3
export var coin_target = 20 #How many coins for an eextra life

var lives
var coins = 0

onready var GUI = Global.GUI

func _ready():
	Global.Gamestate = self
	lives = startingLives
	update_GUI()
	
func update_GUI():
	GUI.update_GUI(coins, lives)
	
func animate_GUI(animation):
	GUI.Animate(animation)
	
func hurt():
	lives -= 1
	Global.Player.hurt()
	update_GUI()
	animate_GUI("Hurt")
	Global.pain_sfx.play()
	if lives < 0:
		end_game()
		
func coin_up():
	coins += 1
	update_GUI()
	animate_GUI("CoinPulse")
	var multiple_of_coin_target = (coins % coin_target) == 0
	if multiple_of_coin_target:
		life_up()
		
func life_up():
	lives += 1
	update_GUI()
	animate_GUI("LifePulse")
		

func end_game():
	get_tree().change_scene(Global.gameover)
	
func win_game():
	get_tree().change_scene(Global.Victory)


func _on_portal_body_entered(body):
	win_game()
