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
signal bubblefactor
func bubble():
	var bubble_length = abs(marketflux)
	bubblefactor.emit(bubble_length)
	
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
var magic = 0

func _on_orb_pressed(magic) -> void:
	print('debug')
	pass # Replace with function body.

var mana = 0
signal mana_charge
func _on_mana_charge_timeout() -> void:
	if mana <4:
		mana += 1
		print('mana = ',mana)
		mana_charge.emit(mana)
	pass # Replace with function body.
