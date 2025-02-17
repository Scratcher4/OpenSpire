var draw_x = camera_get_view_width(view_camera[0]) / 2;
var draw_y = camera_get_view_height(view_camera[0]) / 2;
draw_set_alpha(0.5);
draw_rectangle_color(-32, -32, 992, 572, 0, 0, 0, 0, 0);
draw_set_alpha(1);
draw_sprite_ext(spr_palettechanger_import, ImportButton.activated, ImportButton.xpos, ImportButton.ypos, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_palettechanger_export, ExportButton.activated, ExportButton.xpos, ExportButton.ypos, 1, 1, 0, c_white, 1);
if (!surface_exists(surface))
{
	surface = surface_create(2, 10);
	surface_set_target(surface);
	with (player)
	{
		draw_clear_alpha(c_white, 0);
		pal_swap_draw_palette(spr_palette, 0, 0, 0);
		pal_swap_draw_palette(spr_palette, paletteselect, 1, 0);
		for (var i = 0; i < colorheight; i++)
			draw_point_color(1, i, color[i]);
	}
	surface_reset_target();
}
if (surface_exists(surface))
{
	surface_set_target(surface);
	if (surface_exists(player.surf_pallete))
		draw_surface(player.surf_pallete, 0, 0);
	for (i = 0; i < player.colorheight; i++)
		draw_point_color(1, i, color[i]);
	surface_reset_target();
	draw_surface_ext(surface, 96, draw_y - 160, 40, 40, 0, c_white, 1);
}
var offsetscale = 0.815 * clamp(player.colorheight - 1, 0, player.colorheight);
draw_sprite_ext(spr_palettechanger_window, -1, 93, draw_y - 160 - 3, 1, 1 + offsetscale, 0, c_white, 1);
draw_sprite(spr_palettechanger_selection, -1, 96, (draw_y - 160) + (40 * global.colorchoosen));
if (surface_exists(surface))
{
	pal_swap_set(surface, 1, true);
	draw_sprite_ext(player.sprite_index, player.image_index, draw_x - 152, draw_y + 16, 4, 4, 0, c_white, 1);
	pal_swap_reset();
	pal_swap_set(surface, 1, true);
	draw_sprite_ext(obj_tv.idletvspr, image_idnex, 832, 100, 1, 1, 0, c_white, 1);
	pal_swap_reset();
	draw_sprite_ext(spr_tvframe, 0, 832, 100, 1, 1, 0, c_white, 1);
}
draw_set_font(global.smallfont);
draw_set_halign(1);
draw_set_color(c_white);
draw_text(_draw_x, _draw_y, string_upper(_message));
draw_sprite_ext(spr_palettechanger_textbox, input_text, 480, yi, 5, 1, 0, c_white, 1);
draw_set_font(global.smallfont);
draw_set_halign(1);
draw_set_valign(1);
if (input_text == 1)
{
	var length = -(string_width(string(input)) / 2) + string_width(string(input));
	draw_text_color(480, yi, string(input), c_black, c_black, c_black, c_black, 1);
	draw_text_color(480 + length, yi, cursor, c_black, c_black, c_black, c_black, 1);
}
else
	draw_text_color(480, yi, string(palettename), c_black, c_black, c_black, c_black, 1);
draw_set_valign(0);
