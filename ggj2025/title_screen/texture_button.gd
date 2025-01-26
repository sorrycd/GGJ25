extends TextureButton

# Handles the wobble effect
func _on_mouse_entered():
	# Start the wobble effect when the mouse enters
	wobble_button()

func _on_mouse_exited():
	# Stop all tweens when the mouse exits
	get_tree().tweens.clear()  # Clear all active tweens affecting this node

func wobble_button():
	# Reset rotation
	rotation_degrees = 0

	# Create the tween
	var tween = get_tree().create_tween()

	# Wobble effect: Rotate to 10 degrees, -10 degrees, and back to 0
	tween.tween_property(self, "rotation_degrees", 10, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation_degrees", -10, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation_degrees", 0, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	# Optional: Add a loop if you want the wobble to continue until the mouse leaves
	# tween.set_loops(true)
