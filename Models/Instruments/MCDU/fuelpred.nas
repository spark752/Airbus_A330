# MCDU Fuel Prediction Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var fuelpredPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["Simple_Title"].setText("FUEL PRED");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        showLeft(me, 1, 1, 1, 1, 1, 1);
        showLeftS(me, 1, -1, 1, 1, 1, 1);
        showRight(me, 1, 1, 1, 1, -1, -1);
        showRightS(me, 1, -1, 1, 1, -1, -1);
        showLeftArrow(me, -1, -1, -1, -1, -1, -1);
        showRightArrow(me, -1, -1, -1, -1, -1, -1);
        showCenter(me, 1, 1, -1, -1, -1, -1);
        showCenterS(me, 1, -1, -1, -1, -1, -1);

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
