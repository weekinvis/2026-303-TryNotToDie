extends Button

@export var abas : PackedScene;
var aba_esquerda;
var aba_direita;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _on_mouse_entered() -> void:
	aba_esquerda = abas.instantiate()
	aba_direita = abas.instantiate()

	add_child(aba_esquerda)
	add_child(aba_direita)

	# posiciona
	aba_esquerda.position = Vector2(0 - size.x / 15, size.y / 2)
	aba_direita.position =  Vector2(size.x + size.x / 15, size.y / 2)

	# flip na da direita (ou esquerda, dependendo do sprite)
	aba_direita.flip_h = true

func _on_mouse_exited() -> void:
	if aba_esquerda:
		aba_esquerda.queue_free()
		aba_direita.queue_free()
		aba_esquerda = null
		aba_direita = null
