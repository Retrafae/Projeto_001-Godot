extends CanvasLayer


signal start_game
@onready var message_label: Label = $Control/MessageLabel
@onready var message_timer: Timer = $MessageTimer
@onready var start_button: Button = $Control/StartButton
@onready var score_label: Label = $Control/ScoreLabel




func show_Message(text):
	message_label.text = text
	message_label.show()
	message_timer.start()

func show_gameover():
	show_Message("Game Over")
	await message_timer.timeout
	
	message_label.text = "Dodge the bugs"
	message_label.show()
	
	await get_tree().create_timer(1.0).timeout
	
	start_button.show()
	


func update_score(score):
	score_label.text = str(score)



func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()
	




func _on_message_timer_timeout():
	message_label.hide()
