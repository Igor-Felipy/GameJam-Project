event_inherited(); 

switch(estado) {
    case "parado":
        sprite_index = spr_enemy_idle;
    break;

    case "seguindo_jogador":
        sprite_index = spr_enemy_run;
    break;
}