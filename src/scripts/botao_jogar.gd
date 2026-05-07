extends Button

@export var abas : PackedScene;
var aba_esquerda;
var aba_direita;

var now : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func desenhar_abas() -> void:
	aba_esquerda = abas.instantiate()
	aba_direita = abas.instantiate()

	add_child(aba_esquerda)
	add_child(aba_direita)

	# posiciona
	aba_esquerda.position = Vector2(0 , size.y / 2)
	aba_direita.position =  Vector2(size.x, size.y / 2)

	# flip na da direita (ou esquerda, dependendo do sprite)
	aba_direita.flip_h = true

func apagar_desenho() -> void:
	if aba_esquerda:
		aba_esquerda.queue_free()
		aba_direita.queue_free()
		aba_esquerda = null
		aba_direita = null

func _on_mouse_entered() -> void:
	if not aba_esquerda:
		desenhar_abas();

func _on_mouse_exited() -> void:
	apagar_desenho();

func _on_focus_entered() -> void:
	if now and not aba_esquerda:
		desenhar_abas();
	else:
		now = true;

func _on_focus_exited() -> void:
	apagar_desenho();
