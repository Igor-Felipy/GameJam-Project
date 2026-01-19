// 1. MOVIMENTO (Isso é específico do Slime, o Pai não tem movimento padrão)
if (instance_exists(obj_player)) {
    move_towards_point(obj_player.x, obj_player.y, spd);
}

// 2. HERDAR A LÓGICA DO PAI (Morte e Flash)
// Se você esquecer essa linha, o slime se torna imortal!
event_inherited();