extends Sprite2D

# Define the wobble parameters
@export var wobble_angle: float = 15.0 # Max tilt angle in degrees
@export var wobble_duration: float = 0.3 # Duration of one wobble cycle

func _ready():
	# Start the wobble when the node is ready
	tween_wobble()

func tween_wobble():
	# Convert degrees to radians for the rotation property
	var angle_radians = deg_to_rad(wobble_angle)

	# Create a tween
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	# Tilt to the right
	tween.tween_property(self, "rotation", angle_radians, wobble_duration)

	# Tilt to the left
	tween.chain().tween_property(self, "rotation", -angle_radians, wobble_duration)

	# Return to center
	tween.chain().tween_property(self, "rotation", 0, wobble_duration)

	# Set it to loop infinitely
	tween.set_loops()
