extends Node

var player1
var player2

func _ready():
	# Connect signals of attacks in game.
	pass

func _on_opponent_hit(opponent):
	if opponent.has_node("HealthComponent"):
		#Read damage amount from weapon stats, example for testing below:
		var damage_amount = 25
		opponent.get_node("HealthComponent").take_damage(damage_amount)
