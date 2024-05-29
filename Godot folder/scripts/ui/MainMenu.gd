extends Control

@onready var button_sound=$ButtonSound

var hover_button = preload("res://fx/sound_effects/ui/Menu_hover_sound.wav")
var click_button = preload("res://fx/sound_effects/ui/Menu_Click_Sound.wav")

func _on_play_mouse_entered():
	button_sound.play()


func _on_credits_mouse_entered():
	button_sound.play()

func _on_leave_mouse_entered():
	button_sound.play()


func _on_play_pressed():
	SoundManager.play_ui_sound(click_button)
	AudioGlobalBackground.play_game_music_background()
	SceneManager.change_scene(
	"res://scene/levels/testLevel.tscn",
	SceneManager.Transitions.FADE
	)


func _on_credits_pressed():
	SoundManager.play_ui_sound(click_button)
	pass # Replace with function body.


func _on_leave_pressed():
	SoundManager.play_ui_sound(click_button)
	get_tree().quit()
