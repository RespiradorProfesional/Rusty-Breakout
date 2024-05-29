extends CharacterBody3D
class_name TemplateCharacter

@onready var wheelsSoundPlayer= $wheelsSound
@onready var camera=$Neck/Camera3D
@onready var playerInteractor=$PlayerInteractor
@onready var neck=$Neck
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5
@export var sensitivy_mouse=0.001

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * sensitivy_mouse)
			camera.rotate_x(-event.relative.y * sensitivy_mouse)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
			playerInteractor.rotation.y = neck.rotation.y

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

