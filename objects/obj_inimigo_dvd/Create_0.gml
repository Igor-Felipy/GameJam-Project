event_inherited();

velc = 4;

var _dirs = [45, 135, 225, 315];
var _direcao_inicial = _dirs[irandom(3)];

velh = lengthdir_x(velc, _direcao_inicial);
velv = lengthdir_y(velc, _direcao_inicial);

sprite_index = spr_inimigo_dvd;