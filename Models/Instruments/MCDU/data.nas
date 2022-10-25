# MCDU Data Page UI
# Includes various pages accessible via the DATA pushbutton

# Functions will be called within the namespace of canvas_MCDU_base
var dataPage = func(page_switch) {
    # Legacy variable names
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple"].show();
        me["Simple_Center"].hide();
        me["INITA"].hide();
        me["INITB"].hide();
        me["PERFTO"].hide();
        me["Simple_Title"].setText("DATA INDEX");
        me["Simple_PageNum"].setText("1/2");
        me["Simple_PageNum"].show();
        me["ArrowLeft"].show();
        me["ArrowRight"].show();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].hide();
        me["Simple_L6"].hide();
        me["Simple_L1S"].show();
        me["Simple_L2S"].show();
        me["Simple_L3S"].show();
        me["Simple_L4S"].hide();
        me["Simple_L5S"].hide();
        me["Simple_L6S"].hide();
        me["Simple_L1_Arrow"].show();
        me["Simple_L2_Arrow"].show();
        me["Simple_L3_Arrow"].show();
        me["Simple_L4_Arrow"].show();
        me["Simple_L5_Arrow"].hide();
        me["Simple_L6_Arrow"].hide();
        me["Simple_R1"].hide();
        me["Simple_R2"].hide();
        me["Simple_R3"].hide();
        me["Simple_R4"].hide();
        me["Simple_R5"].show();
        me["Simple_R6"].show();
        me["Simple_R1S"].hide();
        me["Simple_R2S"].hide();
        me["Simple_R3S"].hide();
        me["Simple_R4S"].hide();
        me["Simple_R5S"].show();
        me["Simple_R6S"].show();
        me["Simple_R1_Arrow"].hide();
        me["Simple_R2_Arrow"].hide();
        me["Simple_R3_Arrow"].hide();
        me["Simple_R4_Arrow"].hide();
        me["Simple_R5_Arrow"].show();
        me["Simple_R6_Arrow"].show();

        me.fontLeft(default, default, default, default, default, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, default, default, default, default);
        me.fontRightS(default, default, default, default, default, default);

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
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("DATA INDEX");
        me["Simple_PageNum"].setText("2/2");
        me["Simple_PageNum"].show();
        me["ArrowLeft"].show();
        me["ArrowRight"].show();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].show();
        me["Simple_L6"].show();
        me["Simple_L1S"].hide();
        me["Simple_L2S"].hide();
        me["Simple_L3S"].hide();
        me["Simple_L4S"].hide();
        me["Simple_L5S"].show();
        me["Simple_L6S"].show();
        me["Simple_L1_Arrow"].show();
        me["Simple_L2_Arrow"].show();
        me["Simple_L3_Arrow"].show();
        me["Simple_L4_Arrow"].show();
        me["Simple_L5_Arrow"].show();
        me["Simple_L6_Arrow"].show();
        me["Simple_R1"].show();
        me["Simple_R2"].show();
        me["Simple_R3"].show();
        me["Simple_R4"].show();
        me["Simple_R5"].hide();
        me["Simple_R6"].hide();
        me["Simple_R1S"].show();
        me["Simple_R2S"].show();
        me["Simple_R3S"].show();
        me["Simple_R4S"].show();
        me["Simple_R5S"].hide();
        me["Simple_R6S"].hide();
        me["Simple_R1_Arrow"].show();
        me["Simple_R2_Arrow"].show();
        me["Simple_R3_Arrow"].show();
        me["Simple_R4_Arrow"].show();
        me["Simple_R5_Arrow"].hide();
        me["Simple_R6_Arrow"].hide();

        me.fontLeft(default, default, default, default, default, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, default, default, default, default);
        me.fontRightS(default, default, default, default, default, default);

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
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["Simple_Title"].setText("POSITION MONITOR");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].show();
        me["Simple_L6"].show();
        me["Simple_L1S"].hide();
        me["Simple_L2S"].hide();
        me["Simple_L3S"].hide();
        me["Simple_L4S"].hide();
        me["Simple_L5S"].show();
        me["Simple_L6S"].hide();
        me["Simple_L1_Arrow"].hide();
        me["Simple_L2_Arrow"].hide();
        me["Simple_L3_Arrow"].hide();
        me["Simple_L4_Arrow"].hide();
        me["Simple_L5_Arrow"].hide();
        me["Simple_L6_Arrow"].show();
        me["Simple_C1"].hide();
        me["Simple_C2"].hide();
        me["Simple_C3"].hide();
        me["Simple_C4"].hide();
        me["Simple_C5"].show();
        me["Simple_C6"].hide();
        me["Simple_C1S"].hide();
        me["Simple_C2S"].hide();
        me["Simple_C3S"].hide();
        me["Simple_C4S"].hide();
        me["Simple_C5S"].show();
        me["Simple_C6S"].hide();
        me["Simple_R1"].show();
        me["Simple_R2"].show();
        me["Simple_R3"].show();
        me["Simple_R4"].show();
        me["Simple_R5"].show();
        me["Simple_R6"].show();
        me["Simple_R1S"].hide();
        me["Simple_R2S"].hide();
        me["Simple_R3S"].hide();
        me["Simple_R4S"].hide();
        me["Simple_R5S"].show();
        me["Simple_R6S"].show();
        me["Simple_R1_Arrow"].hide();
        me["Simple_R2_Arrow"].hide();
        me["Simple_R3_Arrow"].hide();
        me["Simple_R4_Arrow"].hide();
        me["Simple_R5_Arrow"].hide();
        me["Simple_R6_Arrow"].show();

        me.fontLeft(default, default, default, default, default, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, default, default, default, default);
        me.fontRightS(default, default, default, default, default, default);

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
