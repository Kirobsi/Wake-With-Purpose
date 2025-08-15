if(fade) image_alpha = abs((image_index / image_number) - 1);

if(decelerate) image_speed = lerp(image_speed, 0.25, 0.25);