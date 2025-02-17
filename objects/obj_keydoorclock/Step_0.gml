with (obj_player)
{
	if (place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == 1 || state == 64 || state == 68 || state == 69 || state == 70) && !instance_exists(obj_fadeout) && state != 77 && state != 61 && state != 62)
	{
		if (ds_list_find_index(global.saveroom, other.id) != -1)
		{
			mach2 = 0;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			state = 77;
			global.roomsave = 0;
		}
		else if (global.key_inv == 1)
		{
			scr_sound(sound_unlockingdoor);
			state = 61;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			with (other)
			{
				ds_list_add(global.saveroom, id);
				image_index = 0;
				sprite_index = spr_clockdoor;
				image_speed = 0.35;
			}
			global.key_inv = 0;
			global.roomsave = 0;
		}
	}
}
