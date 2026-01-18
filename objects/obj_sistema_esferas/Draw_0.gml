if (!instance_exists(obj_player)) exit;

// Espaçamento entre as esferas (em graus)
// Se tiver 5 esferas, será 360/5 = 72 graus de distância uma da outra
var _separacao_graus = 360 / max_esferas_desbloqueadas;

// Loop para desenhar APENAS as esferas que você tem atualmente
for (var i = 0; i < esferas_atuais; i++) {
    
    // Calcula o ângulo desta esfera específica
    // angulo_atual (giro constante) + (índice * separação)
    var _angulo_desta_esfera = angulo_atual + (i * _separacao_graus);
    
    // Calcula a posição X e Y usando lengthdir (Matemática polar)
    var _draw_x = x + lengthdir_x(raio_orbita, _angulo_desta_esfera);
    var _draw_y = y + lengthdir_y(raio_orbita, _angulo_desta_esfera);
    
    // Desenha
    draw_sprite(spr_esfera_magica, 0, _draw_x, _draw_y);
}