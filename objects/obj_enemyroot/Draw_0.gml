if !global.pingpong_mode {
	draw_self()
	exit;
}

var _dir = image_xscale == 0 ? 1 : sign(image_xscale)

if pingpong_boss {
	var _alpha = 1
	if pingpong_hit_timer > 0 and (floor(pingpong_hit_timer / 3) mod 2 == 0) _alpha = 0.35
	draw_sprite_ext(spr_raquetao, 0, x, y, _dir, 1, 0, c_white, _alpha)
} else {
	draw_sprite_ext(spr_pingpong_enemy, 0, x, y, 0.78 * _dir, 0.78, 0, c_white, 1)
}

draw_set_alpha(1)
draw_set_color(c_white)