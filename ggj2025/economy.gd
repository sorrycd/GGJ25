extends Node
var rng = RandomNumberGenerator.new()
@export var stockcount = 3 # number of stocks
var stocks = [] # array of stocks
var stock1 = [0]
@export var fluxlower = -10 # TODO adjust flux per stock
@export var fluxupper = 10

func _init():
	for stock in stockcount:
		stocks.append([0])
	pass
	#print(len(stocks))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func marketflux(): # calling this function generates a random number
	# TODO: add 'springyness' to markets
	var randomnumber = rng.randi_range(fluxlower,fluxupper)
	return randomnumber
signal market_changed
@export var graph_length = 12
func _on_timer_timeout() -> void: #
	for stock in stocks:
		var next = stock[-1]+marketflux()
		stock.append(next)
		market_changed.emit(stocks)
		#print(stock)
		if len(stock) > graph_length:
			#print(true)
			stock.pop_at(0)
	market_changed.emit(stocks)
			
