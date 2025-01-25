extends Node
var rng = RandomNumberGenerator.new()
var stock1 = [0]
@export var fluxlower = -10
@export var fluxupper = 10

# Called when the node enters the scene tree for the first time.
func _input(event) -> void:
	pass
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func marketflux(): # calling this function generates a random number
	# TODO: add 'springyness' to markets
	var randomnumber = rng.randi_range(fluxlower,fluxupper)
	return randomnumber
signal market_changed
func _on_timer_timeout() -> void:
	var next = stock1[-1]+marketflux()
	stock1.append(next)
	market_changed.emit(stock1)
	print(stock1)
	if len(stock1) > 12:
		print(true)
		stock1.pop_at(0)
