// 1. DESENHA O SPRITE NORMAL DO INIMIGO
draw_self();

// 2. DESENHA O FLASH BRANCO (Se tomou dano)
if (flash_alpha > 0) {
    gpu_set_fog(true, flash_cor, 0, 0); // Ativa modo "cor sólida"
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
    
    gpu_set_fog(false, c_white, 0, 0); // Desativa modo cor sólida
}