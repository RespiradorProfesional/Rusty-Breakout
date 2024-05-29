extends TemplateCharacter

var dron_scene_small = preload("res://scene/characters/SmallDron.tscn")  # Ruta a la escena del dron
var dron_scene_tall = preload("res://scene/characters/TallDron.tscn")  # Ruta a la escena del dron
var small_scene = preload("res://assets/Ui/InGameUi/small.png")
var tall_scene = preload("res://assets/Ui/InGameUi/tall.png")

@onready var frameObject= $CanvasLayer/FrameObject
var selectedFrame=1

var dron_instance = null
var camera_jugador = null
var controlling_dron =false

func _process(delta):
	if controlling_dron:
		return  # Si estamos controlando el dron, no mover al jugador	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("firts_slot"):
		selectedFrame=1
		frameObject.texture=small_scene
	if Input.is_action_just_pressed("second_slot"):
		selectedFrame=2
		frameObject.texture=tall_scene
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "foward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if !wheelsSoundPlayer.playing:
			wheelsSoundPlayer.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		wheelsSoundPlayer.stop()
	move_and_slide()
	if Input.is_action_just_pressed("display_dron"):
		spawn_dron()

func spawn_dron():
	var scene_to_instantiate=""
	match selectedFrame:
		1:
			scene_to_instantiate=dron_scene_small
		2:
			scene_to_instantiate=dron_scene_tall
	
	if dron_instance == null:
		dron_instance = scene_to_instantiate.instantiate()
		dron_instance.position = self.position
		get_parent().add_child(dron_instance)
		controlling_dron = true
		set_process(false)  # Desactivar el script del jugador mientras controla el dron
		camera.current = false
		dron_instance.camera.current = true

func _input(event):
	if controlling_dron and Input.is_action_just_pressed("cancel_dron"):
		controlar_jugador()

func controlar_jugador():
	controlling_dron = false
	if dron_instance:
		dron_instance.queue_free()
		dron_instance = null
	set_process(true)  # Reactivar el script del jugador
	camera.current = true

