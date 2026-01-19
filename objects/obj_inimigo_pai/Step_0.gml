// 1. VERIFICAR MORTE
if (hp <= 0) {
    // Drop de itens ou XP pode vir aqui
    instance_destroy();
}

// 2. REDUZIR O EFEITO DE PISCAR (Flash)
if (flash_alpha > 0) {
    flash_alpha -= 0.1; // Vai sumindo o branco aos poucos
}

// 3. COLISÃO COM O PLAYER (Dano no Jogador)
if (place_meeting(x, y, obj_player)) {
    // Se o player não estiver invencível...
    // with (obj_player) { levar_dano(other.dano_contato); }
    // Por enquanto, vamos só reiniciar a sala para teste:
    // room_restart(); 
}