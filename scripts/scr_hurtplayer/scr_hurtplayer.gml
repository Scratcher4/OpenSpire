function scr_hurtplayer(argument0 = obj_player)
{
	if (!global.freezeframe && argument0.state != 110 && argument0.state != 93 && argument0.state != 73)
	{
		with (argument0)
		{
			if (cutscene == 1)
			{
			}
			else if ((state == 19 || state == 20 || state == 13) && cutscene == 0)
			{
			}
			else if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
			{
			}
			else if (state == 101)
			{
				sprite_index = spr_player_mach3hitwall;
				state = 72;
				hsp = 2.5 * xscale;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				instance_create(x, y, obj_bombexplosion);
				for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
				{
					with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, 9), obj_debris))
					{
						sprite_index = spr_minecartdebris;
						image_index = i;
						vsp = floor(random_range(-5, -9));
						hsp = floor(random_range(-5, 7));
					}
				}
			}
			else if (state == 22 && hurted == 0)
			{
			}
			else if (state == 9)
			{
			}
			else if (state == 133 || (state == 106 && flash))
			{
			}
			else if (state == 142)
			{
			}
			else
			{
				if (state != 73 && state != 45 && hurted == 0 && cutscene == 0 && state != 72 && state != 96)
				{
					scr_sound(sound_touchspike);
					global.hurtcounter += 1;
					state = 73;
					alarm[8] = 60;
					alarm[7] = 120;
					hurted = 1;
					if (xscale == other.image_xscale)
						sprite_index = spr_hurtjump;
					else
						sprite_index = spr_hurt;
					if (!is_undefined(argument1))
						movespeed = argument1;
					else
						movespeed = 8;
					vsp = -8;
					timeuntilhpback = 300;
					global.combotime = clamp(global.combotime - 0.5, 0, 60);
					var _oldcollect = global.collect;
					if (global.collect > 100)
						global.collect -= 100;
					else
						global.collect = 0;
					var _repeat = clamp(round((_oldcollect - global.collect) / 10), 0, 15);
					if (global.collect > 0)
					{
						create_small_number(x, y, string(global.collect - _oldcollect), 1);
						repeat (_repeat)
							instance_create(x, y, obj_pizzaloss);
					}
					instance_create(x, y, obj_spikehurteffect);
					image_index = 0;
					flash = 1;
					global.style -= 15;
					with (obj_bosscontroller)
						event_user(1);
					return true;
				}
			}
		}
	}
	return false;
}
