/// @desc Core Enemy Logic
// This enemy has automated jumping and is destroyed by being jumped on top of by the player



//if (vsp < 0) {
//	vsp += grv;
//	vsp = clamp(vsp, -4, 4);
//}




// Horizontal collision
if (place_meeting(x + speed, y, obj_wall)) {
	while (!place_meeting(x + sign(speed), y, obj_wall)) {
		x += sign(speed);
	}
	speed *= -1;
}

// Vertical collision
if (place_meeting(y + vsp, x, obj_wall)) {
	while (!place_meeting(y + sign(vsp), x, obj_wall)) {
		y += sign(vsp);
	}
	vsp = 0;
}

// jumping
if (place_meeting(x + 2 * speed, y, obj_wall)) {
	vsp += jumpspd; // jump
}

vsp += grv;



y += vsp;





//Animation
if (!place_meeting(x, y + 1, obj_wall)) {
	sprite_index = spr_enemy_jump;
	image_speed = 0;
	if (vsp > 0) {
		image_index = 2;
	} else if (vsp == 0) {
		image_index = 1;	
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if (speed == 0) {
		sprite_index = spr_enemy;
	} else {
		sprite_index = spr_enemy_run;
	}
}

if(speed != 0) {
	image_xscale = sign(speed);
}