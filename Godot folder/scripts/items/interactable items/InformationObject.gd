extends Node3D

@export var dialogueName=""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_unfocused(interactor):
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	Dialogic.start(dialogueName)
	


func _on_interactable_focused(interactor):
	print("Interactuar")
