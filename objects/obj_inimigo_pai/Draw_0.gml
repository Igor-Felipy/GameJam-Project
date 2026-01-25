draw_self();

if (flash_alpha > 0) {
    gpu_set_fog(true, flash_cor, 0, 0);
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
    
    gpu_set_fog(false, c_white, 0, 0);
}