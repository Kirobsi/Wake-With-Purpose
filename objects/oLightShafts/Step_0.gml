if (!alphamode) {
	image_alpha -= random_range(0.00002, 0.002);
	if (image_alpha <= 0.25) {alphamode = 1}
}
else {
	image_alpha += random_range(0.00002, 0.002);
	if (image_alpha >= 0.4) {alphamode = 0}
}