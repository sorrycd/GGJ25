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
