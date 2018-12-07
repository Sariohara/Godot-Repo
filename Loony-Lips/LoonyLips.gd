extends Node2D

func _ready():
	var prompt = ["Akira", "Lilly", "fun"]
	var story = "Once upon a time in %s City. There was a girl named %s who was having %s at the Arcade."
	print(story % prompt)
