if !global.pingpong_mode {
	draw_self()
	exit;
}

var _scale = max(0.24, abs(image_xscale) * 0.55)
draw_sprite_ext(spr_pingpong_ball, 0, x, y, _scale, _scale, direction, c_white, 1)