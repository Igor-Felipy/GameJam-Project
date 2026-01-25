event_inherited();

if (place_meeting(x + velh, y, obj_wall)) {
    velh = -velh;
}
x += velh;

if (place_meeting(x, y + velv, obj_wall)) {
    velv = -velv;
}
y += velv;

if (velh != 0) image_xscale = sign(velh);