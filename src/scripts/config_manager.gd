extends Node

@export var Container_Alpha_Menu : VBoxContainer;
@export var Container_Beta_Menu : VBoxContainer;
@export var Personagem_Menu : AnimatedSprite2D;
@export var Pelicula : Sprite2D;
@export var Box_Fonte : HBoxContainer;

var tela : Viewport;

func _ready() -> void:
	Container_Alpha_Menu.get_node("Botao_Jogar").grab_focus()
	
	tela = get_viewport();
	
	if tela == null:
		print('Nao foi possivel obter o visor');
		get_tree().exit();
	
	var tamanho_tela = tela.get_visible_rect().size
	var tamanho_textura = Pelicula.texture.get_size()
	
	var escala_x = (tamanho_tela.x / 3.0) / tamanho_textura.x
	var escala_y = tamanho_tela.y / tamanho_textura.y
	
	Pelicula.scale = Vector2(escala_x, escala_y)
	Pelicula.position = Vector2(
		tamanho_tela.x / 6.0, 
		tamanho_tela.y / 2.0 
	)
	
	Pelicula.visible = false;
	
	Container_Beta_Menu.position.y = tamanho_tela.y / 2.0  - (Container_Beta_Menu.size.y / 2);
	Container_Beta_Menu.position.x = tamanho_tela.x / 12.0;

#func _process(delta: float) -> void:
	#pass



func _on_botao_configuracoes_pressed() -> void:
	Container_Alpha_Menu.visible = false;
	
	var tween = create_tween();
	
	tween.tween_property(Personagem_Menu, "position:x", tela.size.x, 1.35)\
		.set_trans(Tween.TRANS_QUAD)\
		.set_ease(Tween.EASE_IN);
		
	tween.tween_property(Pelicula, "visible", true, 0);
	
	tween.tween_property(Container_Beta_Menu, "visible", true, 0);
	
	Container_Beta_Menu.get_node("Botao_Retornar").grab_focus();


func _on_botao_retornar_pressed() -> void:
	var tween = create_tween();
	
	tween.tween_property(Pelicula, "visible", false, 0);
	tween.tween_property(Container_Beta_Menu, "visible", false, 0);
	
	tween.tween_property(Personagem_Menu, "position:x", tela.size.x/2, 1.35)\
		.set_trans(Tween.TRANS_QUAD)\
		.set_ease(Tween.EASE_IN);
	
	tween.tween_property(Container_Alpha_Menu, "visible", true, 0);
	Container_Alpha_Menu.get_node("Botao_Jogar").grab_focus();


func _on_h_slider_value_changed(value: float) -> void:
	var tema = get_tree().root.theme;
	
	if tema == null:
		tema = Theme.new();
		get_tree().root.theme = tema;
	
	tema.default_font_size = int(value);
