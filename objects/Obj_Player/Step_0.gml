var _key = keyboard_lastchar;
if ord(_key) == ord("w") {
	y-=2
}
if ord(_key) == ord("s") {
	y+=2
}
if ord(_key) == ord("a") {
	x-=2 image_xscale=-1
}
if ord(_key) == ord("d") {
	x+=2 image_xscale=1
}