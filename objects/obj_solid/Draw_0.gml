var _is_net = variable_instance_exists(id, "pingpong_net") ? pingpong_net : false

if !_is_net {
	draw_self()
	exit;
}

var _l = bbox_left
var _r = bbox_right
var _t = bbox_top
var _b = bbox_bottom

draw_sprite_stretched(spr_pingpong_net, 0, _l, _t, max(1, _r - _l), max(1, _b - _t))