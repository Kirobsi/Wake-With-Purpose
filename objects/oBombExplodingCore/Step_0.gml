explodeAnimState++;

switch(explodeAnimState) {
	case 1:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.ysp = -10;
		break;
	case 2:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.ysp = -7;
		_explode.xsp = 7;
		break;
	case 3:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.xsp = 10;
		break;
	case 4:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.ysp = 7;
		_explode.xsp = 7;
		break;
	case 5:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.ysp = 10;
		break;
	case 6:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.ysp = 7;
		_explode.xsp = -7;
		break;
	case 7:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.xsp = -10;
		break;
	case 8:
		var _explode = instance_create_layer(x, y, layer, oBombExploding);
		_explode.ysp = -7;
		_explode.xsp = -7;
		break;
	case 9:
		instance_destroy();
		break;
}