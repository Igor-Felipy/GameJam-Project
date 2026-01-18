if (!instance_exists(obj_player)) exit;

// Precisamos saber a direção da mira para desenhar na posição certa
// Se ninguém estiver apertando nada, mantém a última direção ou usa "direita" (0)
var _dir_desenho = 0;
var _axis_h = keyboard_check(vk_right) - keyboard_check(vk_left);
var _axis_v = keyboard_check(vk_down) - keyboard_check(vk_up);

if (_axis_h != 0 || _axis_v != 0) {
    _dir_desenho = point_direction(0, 0, _axis_h, _axis_v);
    // Salva essa direção numa variável do objeto se quiser que as esferas não "resetem" pra direita quando soltar a tecla
    direction = _dir_desenho; 
} else {
    _dir_desenho = direction; // Usa a última direção salva
}

// LOOP PARA DESENHAR
for (var i = 0; i < esferas_atuais; i++) {
        
    var _cx = x + lengthdir_x(distancia_costas, _dir_desenho + 180);
    var _cy = y + lengthdir_y(distancia_costas, _dir_desenho + 180);
        
    // CENTRALIZAÇÃO DINÂMICA
    // Usa a quantidade desbloqueada para saber onde é o "meio"
    var _offset = (i - (max_esferas_desbloqueadas - 1) / 2) * espacamento;
        
    var _final_x = _cx + lengthdir_x(_offset, _dir_desenho + 90);
    var _final_y = _cy + lengthdir_y(_offset, _dir_desenho + 90);
        
    draw_sprite(spr_esfera_magica, 0, _final_x, _final_y);
}