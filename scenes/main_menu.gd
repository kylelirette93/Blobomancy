extends Control

func _ready():
	pass
	
func _process(delta):
	pass


func _on_button_battle_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/player.tscn")


func _on_button_options_pressed() -> void:
	pass # Replace with function body.


func _on_button_credits_pressed() -> void:
	pass # Replace with function body.


func _on_button_exit_pressed() -> void:
	get_tree().quit()
