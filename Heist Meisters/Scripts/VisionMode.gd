extends CanvasModulate

const DARK = Color("0f1d53")             #0f1d53
const NIGHTVISION_MODE = Color("3fc234") #3fc234
const VISIONERROR = Color("ffffff")
#const MAGENTAPINK_MODE = Color("550d49") #550d49

func _ready():
	add_to_group("interface")
	color = DARK

func Nightvision_mode():
	inform_npcs("NightVision_mode")
	color = NIGHTVISION_MODE
	$NightVsionAudioStream.stream = load(Global.nightvision_on_sfx)
	play_sfx()

func Darkvision_mode():
	inform_npcs("DarkVision_mode")
	color = DARK
	$NightVsionAudioStream.stream = load(Global.nightvision_off_sfx)
	play_sfx()

func VisionError():
	color = VISIONERROR

func play_sfx():
	$NightVsionAudioStream.play()

func inform_npcs(vision_mode):
	get_tree().call_group("npc", vision_mode)

#func MagentaPinkvision_mode():
#	color = MAGENTAPINK_MODE