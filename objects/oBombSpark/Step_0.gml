x += 2 * cos(direction);
y += 2 * sin(direction);

framesMoved++;
if(framesMoved > 15) image_alpha = lerp(image_alpha, 0, 0.3);
if(image_alpha < 0.1) instance_destroy();