event_inherited(); 

if (!instance_exists(obj_player)) exit;

var _distancia = distance_to_object(obj_player);
var _range_tiro = 400;

if (_distancia < _range_tiro) {
    
    var _obstaculo = collision_line(x, y - 32, obj_player.x, obj_player.y - 32, obj_wall, false, false);
    
    if (!_obstaculo) {
        path_end(); 
        
        if (pode_atirar && irandom(10) == 0) {
            pode_atirar = false;
            alarm[1] = 240;
            
            var _dir = point_direction(x, y, obj_player.x, obj_player.y);
            var _tiro = instance_create_layer(x, y, "Instances", obj_tiro_inimigo);
            
            if (instance_exists(_tiro)) {
                _tiro.direction = _dir;
                _tiro.image_angle = _dir;
                _tiro.speed = 4;
                show_debug_message("Ghost Atirou!"); 
            }
        }
    }
}

if (path_speed > 0) {
    sprite_index = spr_ghost; 
} else {
    sprite_index = spr_ghost;
}