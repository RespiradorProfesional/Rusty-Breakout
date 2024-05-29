extends Node

@onready var audioBackground=$AudioBackground
var background_sound=preload("res://fx/music_background/themes/Menu music.mp3")
var gameMusic1=preload("res://fx/music_background/themes/Game music 1.mp3")
var gameMusic2=preload("res://fx/music_background/themes/Game music 2.mp3")

func _play_music(music: AudioStream):
	audioBackground.set_stream(music)
	audioBackground.play()
	
func play_music_main_background():
	_play_music(background_sound)

func play_game_music_background():
	_play_music(gameMusic2)

func _on_audio_background_finished():
	_play_music(audioBackground.stream)
