event_inherited(); 

switch(estado) {
    case "parado":
        path_end();
        if (instance_exists(obj_player)) {
            var range = 300;
            if (distance_to_object(obj_player) <= range) estado = "seguindo_jogador";
        }
    break;

    case "seguindo_jogador":
        if (pode_recalcular && instance_exists(obj_player)) {
            pode_recalcular = false;
            alarm[0] = 20; 
            var x2 = (obj_player.x div 128) * 128 + 64;
            var y2 = (obj_player.y div 128) * 128 + 64;
            if (mp_grid_path(obj_map.mp_grid, caminho, x, y, x2, y2, true)) {
                path_start(caminho, velc, path_action_stop, false);
            }
        }
        if (instance_exists(obj_player)) {
            image_xscale = (obj_player.x > x) ? 1 : -1;
        }
    break;
}