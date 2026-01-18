if (instance_exists(obj_player)) { // Lembre de conferir se é obj_Player ou obj_player
    
    // 1. SEGUIR O PLAYER
    x = obj_player.x;
    y = obj_player.y;
    depth = obj_player.depth + 1;

    // 2. DETECTAR DIREÇÃO DA MIRA
    var _axis_h = keyboard_check(vk_right) - keyboard_check(vk_left);
    var _axis_v = keyboard_check(vk_down) - keyboard_check(vk_up);
    
    if (_axis_h != 0 || _axis_v != 0) {
        var _dir_mira = point_direction(0, 0, _axis_h, _axis_v);
        
        // --- LÓGICA DE TIRO ---
        if (cooldown_tiro <= 0 && esferas_atuais > 0) {
            cooldown_tiro = delay_entre_tiros; 
            
            var _indice = esferas_atuais - 1; 
            
            var _centro_x = x + lengthdir_x(distancia_costas, _dir_mira + 180);
            var _centro_y = y + lengthdir_y(distancia_costas, _dir_mira + 180);
            
            // --- A CORREÇÃO ESTÁ AQUI EMBAIXO ---
            var _offset = (_indice - (max_esferas_desbloqueadas - 1) / 2) * espacamento;
            // ------------------------------------

            var _tiro_x = _centro_x + lengthdir_x(_offset, _dir_mira + 90);
            var _tiro_y = _centro_y + lengthdir_y(_offset, _dir_mira + 90);

            var _p = instance_create_layer(_tiro_x, _tiro_y, "Instances", obj_projetil);
            _p.speed = 8;
            _p.direction = _dir_mira;
            _p.image_angle = _dir_mira;
            
            esferas_atuais -= 1;
            timer_recarga = tempo_recarga; 
        }
    }
    
    // 3. RECUPERAR ESFERAS
    if (esferas_atuais < max_esferas_desbloqueadas) {
        timer_recarga--;
        if (timer_recarga <= 0) {
            esferas_atuais++;
            timer_recarga = tempo_recarga;
        }
    }
    
    if (cooldown_tiro > 0) cooldown_tiro--;
    
} else {
    instance_destroy();
}