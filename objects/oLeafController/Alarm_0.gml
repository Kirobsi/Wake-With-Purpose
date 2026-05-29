var _leafNum = path_get_number(pLeafPoints) - 1;
var _leaf = irandom_range(0, _leafNum);
instance_create_layer(path_get_point_x(pLeafPoints, _leaf), path_get_point_y(pLeafPoints, _leaf) - 16, layer, oLeaf);

alarm_set(0, 20);