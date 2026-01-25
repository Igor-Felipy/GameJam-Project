var margem = 40; 
var x1 = margem; 
var y1 = display_get_gui_height() - lifebar_h - margem;
var amount = (life / life_max) * lifebar_w;
var amount_fixed = (life_max / life_max) * lifebar_w;
var amount_feedback = (life_feedback / life_max) * lifebar_w;
var x2 = x1 + amount;
var x2_fixed = x1 + amount_fixed;
var x2_feedback = x1 + amount_feedback;
var y2 = y1 + lifebar_h;

if(life>0){
	
	draw_set_color(color_2);
	draw_rectangle(x1,y1,x2_fixed,y2,false);
	
	draw_set_color(c_white);
	draw_rectangle(x1,y1,x2_feedback,y2,false);
	
	draw_set_color(color_1);
	draw_rectangle(x1,y1,x2,y2,false);

	draw_set_color(color_2);
	draw_rectangle(x1,y1,x2_fixed,y2,true);
}

draw_set_color(c_white);