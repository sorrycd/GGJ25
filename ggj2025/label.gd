extends Label

@export var scroll_speed = 100.0  # Pixels per second
@export var news_items = [
	"Breaking News: Something Happened!", 
	"Local Event Draws Crowd", 
	"Weather Update Coming Soon"
]

var current_text = ""
var text_width = 0
var viewport_width = 0

func _ready():
	viewport_width = get_viewport_rect().size.x
	
	# Initial setup
	current_text = news_items[0]
	text = current_text
	text_width = size.x
	
	# Position text just off screen to the right
	position.x = viewport_width

func _process(delta):
	# Move text left
	position.x -= scroll_speed * delta
	
	# Reset text when it moves completely off screen
	if position.x < -text_width:
		position.x = viewport_width
		
		# Cycle to next news item
		news_items.push_back(news_items.pop_front())
		current_text = news_items[0]
		text = current_text
		text_width = size.x
