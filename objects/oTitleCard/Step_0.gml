horiz = lerp(horiz, 128, 0.02);
textprogress++;

currenttext = currenttext + string_char_at(cardtext, textprogress);

image_alpha = lerp(image_alpha, 0, 0.1 * fadeout);