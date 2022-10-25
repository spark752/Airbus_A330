# MCDU Fuel Prediction Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var fuelpredPage = func(page_switch) {
    # Legacy variable names
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["Simple_Title"].setText("FUEL PRED");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].show();
        me["Simple_L6"].show();
        me["Simple_L1S"].show();
        me["Simple_L2S"].hide();
        me["Simple_L3S"].show();
        me["Simple_L4S"].show();
        me["Simple_L5S"].show();
        me["Simple_L6S"].show();
        me["Simple_L1_Arrow"].hide();
        me["Simple_L2_Arrow"].hide();
        me["Simple_L3_Arrow"].hide();
        me["Simple_L4_Arrow"].hide();
        me["Simple_L5_Arrow"].hide();
        me["Simple_L6_Arrow"].hide();
        me["Simple_C1"].show();
        me["Simple_C2"].show();
        me["Simple_C3"].hide();
        me["Simple_C4"].hide();
        me["Simple_C5"].hide();
        me["Simple_C6"].hide();
        me["Simple_C1S"].show();
        me["Simple_C2S"].hide();
        me["Simple_C3S"].hide();
        me["Simple_C4S"].hide();
        me["Simple_C5S"].hide();
        me["Simple_C6S"].hide();
        me["Simple_R1"].show();
        me["Simple_R2"].show();
        me["Simple_R3"].show();
        me["Simple_R4"].show();
        me["Simple_R5"].hide();
        me["Simple_R6"].hide();
        me["Simple_R1S"].show();
        me["Simple_R2S"].hide();
        me["Simple_R3S"].show();
        me["Simple_R4S"].show();
        me["Simple_R5S"].hide();
        me["Simple_R6S"].hide();
        me["Simple_R1_Arrow"].hide();
        me["Simple_R2_Arrow"].hide();
        me["Simple_R3_Arrow"].hide();
        me["Simple_R4_Arrow"].hide();
        me["Simple_R5_Arrow"].hide();
        me["Simple_R6_Arrow"].hide();

        me.fontLeft(default, default, default, default, default, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, default, default, default, default);
        me.fontRightS(default, default, default, default, default, default);

        me.fontSizeLeft(normal, normal, normal, normal, normal, normal);
        me.fontSizeRight(normal, normal, normal, normal, normal, normal);

        me.colorLeft("grn", "grn", "blu", "blu", "blu", "grn");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorCenter("grn", "grn", "wht", "wht", "wht", "wht");
        me.colorCenterS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("grn", "grn", "blu", "blu", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L2"].setText("----");
        me["Simple_L3"].setText("--.-/--.-");
        me["Simple_L4"].setText("-.-/-.-");
        me["Simple_L5"].setText("--.-/----");
        me["Simple_L6"].setText("--.-/----");
        me["Simple_L1S"].setText("AT");
        me["Simple_L2S"].setText("X");
        me["Simple_L3S"].setText("GW/CG");
        me["Simple_L4S"].setText("RTE RSV/");
        me["Simple_L5S"].setText("FINAL/TIME");
        me["Simple_L6S"].setText("EXTRA/TIME");
        me["Simple_C1S"].setText("UTC");
        me["Simple_C1"].setText("----");
        me["Simple_C2"].setText("----");
        me["Simple_R1"].setText("-.-");
        me["Simple_R2"].setText("-.-");
        me["Simple_R3"].setText("-.-/--+--");
        me["Simple_R4"].setText("----*/36090");
        me["Simple_R1S"].setText("EFOB");
        me["Simple_R3S"].setText("FOB");
        me["Simple_R4S"].setText("CRZTEMP/TROPO");
    } # page_switch

    if (!node.engrdy.getBoolValue() or node.toFromSet.getValue() != 1) {
        me["Simple_L1"].setText("----");
    } else {
        me["Simple_L1"].setText(node.arrArpt.getValue());
    }
};
