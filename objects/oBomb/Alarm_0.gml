instance_create_layer(x, y, "Instances", oBombExplodingCore);
audio_play_sound(snd_Explode, 0, 0);
bombstate = 0;
x = xstart;
y = ystart;
image_xscale = 0;
image_yscale = 0;
sprite_index = sBomb;
ysp = -5;