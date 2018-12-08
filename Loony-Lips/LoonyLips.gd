extends Node2D

var playerWords = []
var prompt = ["Noun", "Adjective", "Verb", "Noun"]
var story = "Once upon a time in %s. There was a girl who was having %s at the Arcade. She was having a %s and went %s"

func _ready():
	Introduction()
	$BlackBoard/TextBox.clear()

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $BlackBoard/TextBox.text
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	playerWords.append(new_text)
	$BlackBoard/TextBox.clear()
	check_player_word_length()
	
func is_story_done():
	return playerWords.size() == prompt.size()
	
func promptplayer():
	$BlackBoard/StoryText.text = ("Can I have a " + prompt[playerWords.size()] + ", please.")
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		promptplayer()
		
func tell_story():
	$BlackBoard/StoryText.text = story % playerWords
	$BlackBoard/TextureButton/ButtonLabel.text = "Play again"
	end_game()
	
func Introduction():
	$BlackBoard/StoryText.text = ("Welcome to Loony Lips. \n\n In this game it is your job to fill in the words of a sentence.\n\n Can I have "+ prompt[playerWords.size()] + ", please.") 
	
func end_game():
	$BlackBoard/TextBox.queue_free()
	pass