extends Control

func _ready():
	pass
	
func restart_game():
	get_tree().change_scene(Global.level1)
	
func exit_game():
	get_tree().quit()


func _on_TextureButton_pressed():
	restart_game()


func _on_TextureButton2_pressed():
	exit_game()
