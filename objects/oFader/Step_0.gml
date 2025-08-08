x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

#region Fade in

if (fadeFromBlack) {
	if (drawAlpha > 0) {
		drawAlpha -= 0.04;
	}
	else {
		drawAlpha = 0;
		fadeFromBlack = false;
		instance_destroy();
	}
}

#endregion


#region Fade out

else if (fadeToBlack) {
	if (drawAlpha < 1) {
		drawAlpha += 0.04;
	}
	else {
		drawAlpha = 1;
		fadeToBlack = false;
		alarm_set(0, 5);
	}
}

#endregion