timer++;
if (timer >= 70) {
	xoffset++;
	timer -= 70;
}

if (xoffset >= 968) {xoffset = 0}