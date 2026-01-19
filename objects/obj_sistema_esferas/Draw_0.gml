if (!instance_exists(obj_player)) exit;

for (var i = 0; i < max_esferas_desbloqueadas; i++) {
    
    var _angulo_esfera = 0;
    
    if (max_esferas_desbloqueadas > 1) {
        // Matemática do arco (igual ao Step)
        var _step = arco_total / (max_esferas_desbloqueadas - 1);
        var _inicio = direcao_costas - (arco_total / 2);
        _angulo_esfera = _inicio + (i * _step);
    } else {
        _angulo_esfera = direcao_costas;
    }
    
    // Posição visual
    var _draw_x = x + lengthdir_x(raio_orbita, _angulo_esfera);
    var _draw_y = y + lengthdir_y(raio_orbita, _angulo_esfera);
    
    // Desenha
    draw_sprite(spr_esfera_magica, 0, _draw_x, _draw_y);
}