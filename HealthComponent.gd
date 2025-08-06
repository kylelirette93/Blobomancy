class_name HealthComponent extends Node

@export var max_health: int = 100
@export var current_health: int = max_health:
	set(value):
		# Clamp current health to prevent negative values.
		current_health = clamp(value, 0, max_health)
		if current_health <= 0:
			# Emit a signal on death.
			died.emit()

# Signals to be implemented in the future.
signal health_changed(new_health)
signal died

# Take damage function, subtracts amount passed from current health.
func take_damage(amount: int):
	current_health -= amount
	print("Damage dealth! Health is now: ", current_health)

# Heal function add's amount to current health. To be called from totem passive, etc.
func heal(amount: int):
	current_health += amount
	print("Healed! Health is now: ", current_health)
