if (instance_exists(obj_player)) {
    // 1. SEGUIR O PLAYER
    x = obj_player.x;
    y = obj_player.y;
    
    // 2. GIRA AS ESFERAS (Animação de órbita)
    angulo_atual += velocidade_rotacao;
    if (angulo_atual >= 360) angulo_atual -= 360; // Mantém o ângulo entre 0 e 360

    // 3. LOGICA DE TIRO
    // Detecta teclas (Setinhas)
    var _axis_h = keyboard_check(vk_right) - keyboard_check(vk_left);
    var _axis_v = keyboard_check(vk_down) - keyboard_check(vk_up);
    
    if (_axis_h != 0 || _axis_v != 0) {
        var _dir_mira = point_direction(0, 0, _axis_h, _axis_v);
        
        if (cooldown_tiro <= 0 && esferas_atuais > 0) {
            cooldown_tiro = delay_entre_tiros; 
            
            // Cria o tiro saindo do próprio Player (mais fácil de mirar)
            // OU se quiser que saia da esfera, precisa calcular a posição da última esfera (mais complexo)
            // Vamos fazer sair do player na direção da mira para ser preciso:
            var _p = instance_create_layer(x, y, "Instances", obj_projetil);
            _p.speed = 8;
            _p.direction = _dir_mira;
            _p.image_angle = _dir_mira;
            
            esferas_atuais -= 1; // Gasta uma esfera
            timer_recarga = tempo_recarga; // Reinicia o timer de recarga
        }
    }
    
    // 4. RECUPERAR ESFERAS (RECARGA)
    // Se tiver menos esferas do que o máximo desbloqueado...
    if (esferas_atuais < max_esferas_desbloqueadas) {
        timer_recarga--; // Diminui o tempo
        
        // Quando o tempo acaba, ganha uma esfera e reseta o timer
        if (timer_recarga <= 0) {
            esferas_atuais++;
            timer_recarga = tempo_recarga;
        }
    }
    
    if (cooldown_tiro > 0) cooldown_tiro--;
    
} else {
    instance_destroy();
}