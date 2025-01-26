extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_stockprice_mana_charge(i) -> void:
	text = 'mana:'+str(i)+"/1"
	pass # Replace with function body.
