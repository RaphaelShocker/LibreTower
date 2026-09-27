if pingpong_racket {
	var _w = max(32, 32 * abs(image_xscale))
	var _cx = x + (_w * 0.5)
	var _cy = y + 8
	var _scale = max(0.50, _w / 96)
	draw_sprite_ext(spr_pingpong_racket, 0, _cx, _cy, _scale, _scale, 0, c_white, 1)
} else if debug {
	draw_rectangle(x, y, x + (32 * image_xscale), y + 16, active ? false : true)
} else {
	draw_self()
}