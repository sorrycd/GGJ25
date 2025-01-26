extends Node
var rng = RandomNumberGenerator.new()# number of stocks
var effects
@export var price = 5
@export var stockname = '$WHT'
var stock = [price]
@export var fluxlower = -10 # TODO adjust flux per stock
@export var fluxupper = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func marketflux(): # calling this function generates a random number
	# TODO: add 'springyness' to markets
	var randomnumber = rng.randi_range(fluxlower,fluxupper)
	return randomnumber
signal market_changed
signal buy_price
@export var graph_length = 24
func _on_timer_timeout() -> void: #
	var mf = marketflux()
	price = abs(stock[-1]+mf+0)
	
	buy_price.emit(price)
	stock.append(price)
	market_changed.emit(stock)
	#print(stock)
	if len(stock) > graph_length:
		stock.pop_at(0)
	market_changed.emit(stock)
	
