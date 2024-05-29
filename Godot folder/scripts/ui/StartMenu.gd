extends Control

var click_button = preload("res://fx/sound_effects/ui/Menu_Click_Sound.wav")

func _ready():
	AudioGlobalBackground.play_music_main_background()

func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.pressed:
			SoundManager.play_ui_sound(click_button)
			SceneManager.change_scene(
			"res://scene/ui/MainMenu.tscn",
			SceneManager.Transitions.FADE
			)
