if (instance_exists(obj_player)) {
    // 1. SEGUIR O PLAYER
    x = obj_player.x;
    y = obj_player.y;
    
    // 2. DETECTAR DIREÇÃO DA MIRA (Setinhas)
    var _axis_h = keyboard_check(vk_right) - keyboard_check(vk_left);
    var _axis_v = keyboard_check(vk_down) - keyboard_check(vk_up);
    
    // Se estiver apertando alguma tecla, atualiza a direção da mira
    if (_axis_h != 0 || _axis_v != 0) {
        direcao_mira = point_direction(0, 0, _axis_h, _axis_v);
    }
    
    // 3. SUAVIZAÇÃO DO MOVIMENTO (LERP ANGULAR)
    // O alvo é a direção oposta da mira (+180)
    var _target_costas = direcao_mira + 180;
    
    // angle_difference descobre o caminho mais curto para girar
    // O 0.1 é a velocidade (10% por frame). Aumente para ficar mais rápido.
    direcao_costas += angle_difference(_target_costas, direcao_costas) * 0.1;

    // 4. LÓGICA DE TIRO
    // Verifica apenas o cooldown
    if ((_axis_h != 0 || _axis_v != 0) && cooldown_tiro <= 0) {
        cooldown_tiro = delay_entre_tiros; 
        
        // LOOP PARA CRIAR UM TIRO EM CADA ESFERA
        for (var i = 0; i < max_esferas_desbloqueadas; i++) {
            
            // --- CÁLCULO DA POSIÇÃO NO LEQUE ---
            // Precisamos saber onde essa esfera 'i' está desenhada agora
            
            var _angulo_esfera = 0;
            
            if (max_esferas_desbloqueadas > 1) {
                // Se tiver mais de 1, espalha elas no arco
                // Ex: Se arco é 120, começa em -60 e vai até +60 em volta do centro
                var _step = arco_total / (max_esferas_desbloqueadas - 1);
                var _inicio = direcao_costas - (arco_total / 2);
                _angulo_esfera = _inicio + (i * _step);
            } else {
                // Se só tem 1 esfera, ela fica exatamente no centro das costas
                _angulo_esfera = direcao_costas;
            }
            
            // Calcula posição X e Y da esfera
            var _spawn_x = x + lengthdir_x(raio_orbita, _angulo_esfera);
            var _spawn_y = y + lengthdir_y(raio_orbita, _angulo_esfera);
            
            // CRIA O TIRO
            var _p = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_projetil);
            
            // Configura o tiro para sair PARALELO à mira (reto)
            _p.speed = 8;
            _p.direction = direcao_mira; // Vai na direção que você apertou
            _p.image_angle = direcao_mira;
        }
    }
    
    if (cooldown_tiro > 0) cooldown_tiro--;
    
} else {
    instance_destroy();
}