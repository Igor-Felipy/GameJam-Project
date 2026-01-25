view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height((view_camera[0]));
display_set_gui_size(view_w,view_h);

if(object_exists(obj_player)){
life_max = obj_player.max_life;
}
life = life_max;
life_feedback = life_max;
lifebar_w = 80;
lifebar_h = 10;


color_1 = make_color_rgb(255,0,64);
color_2 = make_color_rgb(19,19,19);
