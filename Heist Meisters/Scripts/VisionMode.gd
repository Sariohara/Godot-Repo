extends CanvasModulate

const DARK = Color("0f1d53") #0f1d53
const NIGHTVISIONMODE = Color("3fc234") #3fc234

func _ready():
	color = DARK
	
func Nightvision_mode():
	color = NIGHTVISIONMODE

func Darkvision():
	color = DARK