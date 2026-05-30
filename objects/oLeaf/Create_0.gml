moving = true;
canLand = false;
alarm_set(0, 60);
alarm_set(1, 70);
image_angle = irandom_range(0, 359);
rotateDir = irandom_range(0, 1); if(rotateDir == 0) rotateDir--;