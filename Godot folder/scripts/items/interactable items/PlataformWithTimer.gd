extends Node3D

@onready var plataforms=$Plataforms
@onready var timer=$Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	plataforms.visible=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_focused(interactor):
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	plataforms.visible=true
	timer.start()

func _on_interactable_unfocused(interactor):
	pass # Replace with function body.


func _on_timer_timeout():
	plataforms.visible=false
