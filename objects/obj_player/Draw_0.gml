if !visible exit;

if state == states.taunt draw_sprite(spr_flash, 0, x, y)

var _rx = 18
var _ry = 18
var _spd = point_distance(0, 0, hsp, vsp)

if state == states.grab or state == states.run {
	_rx += min(8, abs(hsp) * 0.45)
	_ry -= min(5, abs(hsp) * 0.20)
}
if state == states.superjump {
	_rx = 14
	_ry = 25
}
if crouched {
	_rx = 21
	_ry = 13
}

var _sx = (_rx * 2) / 64
var _sy = (_ry * 2) / 64

// Trail now uses the real ping-pong sprite.
if _spd > 6 or state == states.grab or state == states.run {
	for (var _t = 3; _t >= 1; _t--) {
		draw_set_alpha(0.05 * (4 - _t))
		draw_sprite_ext(
			spr_pingpong_ball, 0,
			x - hsp * _t * 1.35,
			y - vsp * _t * 0.45,
			_sx, _sy, pingpong_spin, c_white, 1
		)
	}
}

draw_set_alpha(invuln and (floor(invulm_timer / 4) mod 2 == 0) ? 0.35 : 1)
draw_sprite_ext(spr_pingpong_ball, 0, x, y, _sx, _sy, pingpong_spin, c_white, 1)
draw_set_alpha(1)
draw_set_color(c_white)

if !debug exit

draw_point(x + 25 * sign(hsp), y)
if showcol draw_sprite(mask_index,0,x,y)
if showdebug {
	draw_set_font(fnt_textregular)
	var _i = 1
	for (var i = 0; i < array_length(statevars); i++) {
		if statevars[i] != 0 {
			draw_text(x - 64, (y - 128) + 16 * _i, string(statevars[i]))
			_i++
		}
	}
}