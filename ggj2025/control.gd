extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_buy_pressed() -> void:
	$Click1.play()
	pass # Replace with function body.

func _on_sell_pressed() -> void:
	$Click2.play()
	pass # Replace with function body.
	


func _on_orb_pressed() -> void:
	$Magic.play()
	pass # Replace with function body.
