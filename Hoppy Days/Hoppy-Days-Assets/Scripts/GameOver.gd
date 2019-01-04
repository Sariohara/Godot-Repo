extends Control

func _ready():
	pass
	
func restart_game():
	get_tree().change_scene("res://Scenes/Level1.tscn")
	
func exit_game():
	get_tree().quit()


func _on_TextureButton_pressed():
	restart_game()


func _on_TextureButton2_pressed():
	exit_game()
