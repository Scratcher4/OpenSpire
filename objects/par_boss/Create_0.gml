state = -4;
bossstarted = false;
xscale = 1;
scr_collision_init();
grav = 0.5;
movespeed = 0;
atkqueue = ds_queue_create();
atktimer = 75;
flash = false;
hurted = false;
phase = 1;
setfordeath = false;
grabbed_spr = spr_painter_stun;
hurt_spr = spr_painter_hurt;
normal_spr = spr_painter_idle;
vulnerable_spr = spr_painter_tired;
