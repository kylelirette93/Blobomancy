extends Control

@export var tween_intensity: float
@export var tween_duration: float

@onready var battle: Button = $VBoxContainer/ButtonBattle
@onready var options: Button = $VBoxContainer/ButtonOptions
@onready var credits: Button = $VBoxContainer/ButtonCredits
@onready var exit: Button = $VBoxContainer/ButtonExit

func _ready():
	pass
	
func _process(delta):
	btn_hovered(battle)
	btn_hovered(options)
	btn_hovered(credits)
	btn_hovered(exit)


func _on_button_battle_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ModeSelection.tscn")


func _on_button_options_pressed() -> void:
	pass # Replace with function body.


func _on_button_credits_pressed() -> void:
	pass # Replace with function body.

func start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)

func btn_hovered(button: Button):
	button.pivot_offset = button.size / 2
	if button.is_hovered():
		start_tween(button, "scale", Vector2.ONE * tween_intensity, tween_duration)
	else:
		start_tween(button, "scale", Vector2.ONE, tween_duration)
