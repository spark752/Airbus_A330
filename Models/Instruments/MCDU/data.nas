# MCDU Data Page UI
# Includes various pages accessible via the DATA pushbutton

# Functions will be called within the namespace of canvas_MCDU_base
var dataPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("DATA INDEX");
        me["Simple_PageNum"].setText("1/2");
        me["Simple_PageNum"].show();
        me["ArrowLeft"].show();
        me["ArrowRight"].show();

        showLeft(me, 1, 1, 1, 1, -1, -1);
        showLeftS(me, 1, 1, 1, -1, -1, -1);
        showRight(me, -1, -1, -1, -1, 1, 1);
        showRightS(me, -1, -1, -1, -1, 1, 1);
        showLeftArrow(me, 1, 1, 1, 1, -1, -1);
        showRightArrow(me, -1, -1, -1, -1, 1, 1);

        me.fontSizeLeft(normal, normal, normal, normal, normal, normal);
        me.fontSizeRight(normal, normal, normal, normal, normal, normal);

        me.colorLeft("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L1"].setText(" MONITOR");
        me["Simple_L2"].setText(" MONITOR");
        me["Simple_L3"].setText(" MONITOR");
        me["Simple_L4"].setText(" A/C STATUS");
        me["Simple_L1S"].setText(" POSITION");
        me["Simple_L2S"].setText(" IRS");
        me["Simple_L3S"].setText(" GPS");
        me["Simple_R5"].setText("FUNCTION ");
        me["Simple_R6"].setText("FUNCTION ");
        me["Simple_R5S"].setText("PRINT ");
        me["Simple_R6S"].setText("AOC ");
    } # page_switch
};

var data2Page = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("DATA INDEX");
        me["Simple_PageNum"].setText("2/2");
        me["Simple_PageNum"].show();
        me["ArrowLeft"].show();
        me["ArrowRight"].show();

        showLeft(me, 1, 1, 1, 1, 1, 1);
        showLeftS(me, -1, -1, -1, -1, 1, 1);
        showRight(me, 1, 1, 1, 1, -1, -1);
        showRightS(me, 1, 1, 1, 1, -1, -1);
        showLeftArrow(me, 1, 1, 1, 1, 1, 1);
        showRightArrow(me, 1, 1, 1, 1, -1, -1);

        me.fontSizeLeft(normal, normal, normal, normal, normal, normal);
        me.fontSizeRight(normal, normal, normal, normal, normal, normal);

        me.colorLeft("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L1"].setText(" WAYPOINTS");
        me["Simple_L2"].setText(" NAVAIDS");
        me["Simple_L3"].setText(" RUNWAYS");
        me["Simple_L4"].setText(" ROUTES");
        me["Simple_L5"].setText(" WINDS");
        me["Simple_L6"].setText(" WINDS");
        me["Simple_L5S"].setText(" ACTIVE F-PLN");
        me["Simple_L6S"].setText(" SEC F-PLN");
        me["Simple_R1"].setText("WAYPOINTS ");
        me["Simple_R2"].setText("NAVAIDS ");
        me["Simple_R3"].setText("RUNWAYS ");
        me["Simple_R4"].setText("ROUTES ");
        me["Simple_R1S"].setText("PILOTS ");
        me["Simple_R2S"].setText("PILOTS ");
        me["Simple_R3S"].setText("PILOTS ");
        me["Simple_R4S"].setText("PILOTS ");
    } # page_switch
};

var posmonPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["Simple_Title"].setText("POSITION MONITOR");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        showLeft(me, 1, 1, 1, 1, 1, 1);
        showLeftS(me, -1, -1, -1, -1, 1, -1);
        showRight(me, 1, 1, 1, 1, 1, 1);
        showRightS(me, -1, -1, -1, -1, 1, 1);
        showLeftArrow(me, -1, -1, -1, -1, -1, 1);
        showRightArrow(me, -1, -1, -1, -1, -1, 1);
        showCenter(me, -1, -1, -1, -1, 1, -1);
        showCenterS(me, -1, -1, -1, -1, 1, -1);

        me.fontSizeLeft(normal, normal, normal, normal, normal, normal);
        me.fontSizeRight(normal, normal, normal, normal, normal, normal);

        me.colorLeft("wht", "wht", "wht", "wht", "grn", "blu");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "blu");
        me.colorRight("grn", "grn", "grn", "grn", "grn", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L1"].setText("FMGC1");
        me["Simple_L2"].setText("FMGC2");
        me["Simple_L3"].setText("GPIRS");
        me["Simple_L4"].setText("MIX IRS");
        me["Simple_L5"].setText("NAV -.-");
        me["Simple_L6"].setText(" FREEZE");
        me["Simple_L5S"].setText("   IRS1");
        me["Simple_R1"].setText("----.-X/-----.-X");
        me["Simple_R2"].setText("----.-X/-----.-X");
        me["Simple_R3"].setText("----.-X/-----.-X");
        me["Simple_R4"].setText("----.-X/-----.-X");
        me["Simple_R5"].setText("NAV -.-");
        me["Simple_R5S"].setText("IRS3   ");
        me["Simple_R6S"].setText("SEL ");
        me["Simple_C5"].setText("NAV -.-");
        me["Simple_C5S"].setText("IRS2");
    } # page_switch
};
