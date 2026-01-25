cell_t = 128;
room_width = cell_t * 80;
room_height = room_width div 2;
cell_h = room_width div cell_t;
cell_v = room_height div cell_t;

grid = ds_grid_create(cell_h,cell_v);
ds_grid_clear(grid,0);
mp_grid = mp_grid_create(0, 0, cell_h * cell_t, cell_v * cell_t, cell_t, cell_t);

randomise();
var dir = irandom(3);

var xx = cell_h div 2;
var yy = cell_v div 2;
var chances = 1;
var passos = 400;
var inimigo_max = irandom_range(20,35)

var chao_index = 17;
norte = 1;
oeste = 2;
leste = 4;
sul = 8;

var tile_layer = layer_tilemap_get_id("WallTiles")

for(var i=0; i < passos;i+=1){
dir = irandom(3);

	
	xx+=round(lengthdir_x(1,dir*90));
	yy+=round(lengthdir_y(1,dir*90));

	xx = clamp(xx,2,cell_h -2)
	yy = clamp(yy,2,cell_v -2)

	grid[# xx,yy] = 1;
}

for(var xx=0; xx<cell_h; xx++){
    for(var yy=0; yy<cell_v; yy++){
        if(grid[# xx, yy] == 0){
            
            var norte_t = (yy > 0) && (grid[# xx, yy-1] == 0);
            var oeste_t = (xx > 0) && (grid[# xx-1, yy] == 0);
            var leste_t = (xx < cell_h-1) && (grid[# xx+1, yy] == 0);
            var sul_t   = (yy < cell_v-1) && (grid[# xx, yy+1] == 0);

            var tile_index = (norte_t * norte) + (oeste_t * oeste) + (leste_t * leste) + (sul_t * sul) + 1;
            
            tilemap_set(tile_layer, tile_index, xx, yy);
            
        } else {
            tilemap_set(tile_layer, 17, xx, yy);
        }
    }
}

var lista_inimigos = [obj_inimigo_corvo_simples,obj_inimigo_dvd,obj_inimigo_ghost];

for(var xx=0; xx<cell_h; xx++){
    for(var yy=0; yy<cell_v; yy++){
        
        if(grid[# xx, yy] == 0){
            instance_create_layer(xx*cell_t, yy*cell_t, "Instances", obj_wall);
        }
        
        if(grid[# xx, yy] == 1){
            var x1 = xx * cell_t + cell_t / 2;
            var y1 = yy * cell_t + cell_t / 2;

            if(!instance_exists(obj_player)){
                instance_create_layer(x1, y1, "Instances", obj_player);
            }
            
            if(inimigo_max > 0){
                var chances_t = 25;
                
                if(instance_exists(obj_player)){
                    if(irandom(chances_t) == chances_t && point_distance(x1, y1, obj_player.x, obj_player.y) > 500){
                        
                        var indice_aleatorio = irandom(array_length(lista_inimigos) - 1);
                        var inimigo_escolhido = lista_inimigos[indice_aleatorio];
                        
                        instance_create_layer(x1, y1, "Instances", inimigo_escolhido);
                        
                        inimigo_max -= 1;
                    }
                }
            }
        }
    }
}

var portal_criado = false;
var tentativas = 0;

while (!portal_criado && tentativas < 1000) {
    var px = irandom(cell_h - 1);
    var py = irandom(cell_v - 1);
    
    if (grid[# px, py] == 1) {
        var p_real_x = px * cell_t + cell_t / 2;
        var p_real_y = py * cell_t + cell_t / 2;
        
        if (point_distance(p_real_x, p_real_y, obj_player.x, obj_player.y) > 1500) {
            instance_create_layer(p_real_x, p_real_y, "Instances", obj_portal);
            portal_criado = true;
        }
    }
    tentativas++;
}

if (!portal_criado) {
    for(var xx=0; xx<cell_h; xx++){
        for(var yy=0; yy<cell_v; yy++){
            if(grid[# xx, yy] == 1 && !portal_criado){
                 instance_create_layer(xx*cell_t + cell_t/2, yy*cell_t + cell_t/2, "Instances", obj_portal);
                 portal_criado = true;
            }
        }
    }
}

mp_grid_add_instances(mp_grid,obj_wall,false)