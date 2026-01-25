if (hp <= 0) {
    instance_destroy();
}

if (flash_alpha > 0) {
    flash_alpha -= 0.1;
}

if (place_meeting(x, y, obj_player)) {
    if (!obj_player.invencivel) {
        obj_player.Vida -= dano_contato;
        obj_player.invencivel = true;
        
        with(obj_player) {
            alarm[0] = 60; 
        }
    }
}