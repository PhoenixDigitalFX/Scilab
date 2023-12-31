// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

function layer = create_layer(count)
    c = get(0);c.usedeprecatedskin = "off"
    f = figure("dockable", "off" ,"infobar_visible", "off", "toolbar_visible", "off", "menubar_visible", "off", "layout", "border")
    f.figure_size = [300, 300];

    //layer
    layer = uicontrol(f, "style", "layer", "constraints", createConstraints("border", "center"));

    for i = 1:count
        fr1 = uicontrol(layer, "style", "frame");
        fr1.layout_options = createLayoutOptions("border", [10, 10]);
        fr1.layout = "border";
        uicontrol(fr1, "string", "button " + string(i) + "1", "constraints", createConstraints("border", "top"));
        uicontrol(fr1, "string", "button " + string(i) + "2", "constraints", createConstraints("border", "left"));
        uicontrol(fr1, "string", "button " + string(i) + "3", "constraints", createConstraints("border", "center"));
        uicontrol(fr1, "string", "button " + string(i) + "4", "constraints", createConstraints("border", "bottom"));
        uicontrol(fr1, "string", "button " + string(i) + "5", "constraints", createConstraints("border", "right"));
    end
endfunction

//1 layer
layer = create_layer(1);
visible1 = ['on'];

assert_checkequal(layer.value, 1);
assert_checkequal(layer.children.visible, visible1);

layer.value = 2;
assert_checkequal(layer.value, 2);
//if value is out of bounds, nothing happen but value is normally set
assert_checkequal(layer.children.visible, visible1);

//4 layers
delete(gcf());
layer = create_layer(4);

visible1 = ['on';'off';'off';'off'];
visible2 = ['off';'on';'off';'off'];
visible3 = ['off';'off';'on';'off'];
visible4 = ['off';'off';'off';'on'];

assert_checkequal(layer.value, 1);
assert_checkequal(layer.children.visible, visible1);

layer.value = 2;
assert_checkequal(layer.value, 2);
assert_checkequal(layer.children.visible, visible2);

layer.value = 3;
assert_checkequal(layer.value, 3);
assert_checkequal(layer.children.visible, visible3);

layer.value = 4;
assert_checkequal(layer.value, 4);
assert_checkequal(layer.children.visible, visible4);

layer.value = 10;
assert_checkequal(layer.value, 10);
//if value is out of bounds, nothing happen but value is normally set
assert_checkequal(layer.children.visible, visible4);
