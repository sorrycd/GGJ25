extends Node2D

@onready var button: TextureButton = $CanvasLayer/Control/TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://stock_ticker.tscn")
	pass # Replace with function body.
