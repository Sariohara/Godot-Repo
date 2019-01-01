extends Node2D

var playerWords = []
var currentStory
var strings

func _ready():
	set_random_stories()
	Introduction()
	promptplayer()
	$BlackBoard/TextBox.text = ""
	
func set_random_stories():
	var stories = get_from_json("stories.json")
	randomize()
	currentStory = stories[randi() % stories.size()]
	
func get_from_json(filename):
	var i = 0
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $BlackBoard/TextBox.text
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	playerWords.append(new_text)
	$BlackBoard/TextBox.text = ""
	$BlackBoard/StoryText.text = ""
	check_player_word_length()
	
func is_story_done():
	return playerWords.size() == currentStory["prompt"].size()
	
func promptplayer():
	var nextPrompt = currentStory["prompt"][playerWords.size()]
	$BlackBoard/StoryText.text += (strings["prompt"] % nextPrompt)
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		promptplayer()
		
func tell_story():
	$BlackBoard/StoryText.text = currentStory["story"] % playerWords
	$BlackBoard/TextureButton/ButtonLabel.text = strings["again"]
	end_game()
	
func Introduction():
	strings = get_from_json("other_strings.json")
	$BlackBoard/StoryText.text = strings["intro_text"] 
	
func end_game():
	$BlackBoard/TextBox.queue_free()
	pass