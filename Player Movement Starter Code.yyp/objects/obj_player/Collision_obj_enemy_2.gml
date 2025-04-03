/// @desc Enemy collision

if(!disabled) {
	if(currjumps == 1 and place_meeting(x, y + 1, other)) // jumping on top of enemy
	{
		instance_destroy(other);
	}
	else
	{
		disabled = true;
		alarm[0] = room_speed * 2;
		image_blend = c_red;
	}
}