# MCDU Menu Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var menuPage = func(page_switch) {
    # Legacy variable names
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("MCDU MENU");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();
        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].hide();
        me["Simple_L6"].hide();
        me["Simple_L1S"].hide();
        me["Simple_L2S"].hide();
        me["Simple_L3S"].hide();
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
        me["Simple_R5"].hide();
        me["Simple_R6"].show();
        me["Simple_R1S"].hide();
        me["Simple_R2S"].hide();
        me["Simple_R3S"].hide();
        me["Simple_R4S"].hide();
        me["Simple_R5S"].hide();
        me["Simple_R6S"].hide();
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

        me.colorLeft("ack", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L2"].setText(" ACARS");
        me["Simple_L3"].setText(" AIDS");
        me["Simple_L4"].setText(" CFDS");
        me["Simple_R6"].setText("RETURN ");
    } # page_switch
    if (me.active_prop.getValue() == 1) {
        me["Simple_L1"].setText(" FMGC(SEL)");
        me["Simple_L1"].setColor(0.0901,0.6039,0.7176);
    } else if (me.active_prop.getValue() == 2) {
        me["Simple_L1"].setText(" FMGC");
        me["Simple_L1"].setColor(0.0509,0.7529,0.2941);
    } else {
        me["Simple_L1"].setText(" FMGC");
        me["Simple_L1"].setColor(1,1,1);
    }
};

var statusPage = func(page_switch) {
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
        me["Simple_Title"].setText("    " ~ node.acType.getValue());
        me["Simple_PageNum"].setText("X/X");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].hide();
        me["Simple_L5"].show();
        me["Simple_L6"].show();
        me["Simple_L1S"].show();
        me["Simple_L2S"].show();
        me["Simple_L3S"].show();
        me["Simple_L4S"].hide();
        me["Simple_L5S"].show();
        me["Simple_L6S"].show();
        me["Simple_L1_Arrow"].hide();
        me["Simple_L2_Arrow"].hide();
        me["Simple_L3_Arrow"].show();
        me["Simple_L4_Arrow"].hide();
        me["Simple_L5_Arrow"].hide();
        me["Simple_L6_Arrow"].hide();
        me["Simple_R1"].hide();
        me["Simple_R2"].show();
        me["Simple_R3"].hide();
        me["Simple_R4"].hide();
        me["Simple_R5"].hide();
        me["Simple_R6"].show();
        me["Simple_R1S"].hide();
        me["Simple_R2S"].hide();
        me["Simple_R3S"].hide();
        me["Simple_R4S"].hide();
        me["Simple_R5S"].hide();
        me["Simple_R6S"].show();
        me["Simple_R1_Arrow"].hide();
        me["Simple_R2_Arrow"].hide();
        me["Simple_R3_Arrow"].hide();
        me["Simple_R4_Arrow"].hide();
        me["Simple_R5_Arrow"].hide();
        me["Simple_R6_Arrow"].show();

        me.fontLeft(default, default, default, default, symbol, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, default, default, default, default);
        me.fontRightS(default, default, default, default, default, default);

        me.fontSizeLeft(normal, normal, normal, normal, small, normal);
        me.fontSizeRight(normal, normal, normal, normal, normal, normal);

        me.colorLeft("grn", "blu", "blu", "wht", "blu", "grn");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "blu", "blu", "wht", "wht", "wht");
        me.colorRight("wht", "grn", "wht", "wht", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L5"].setText("[   ]");
        me["Simple_L6"].setText("+0.0/+0.0");
        me["Simple_L1S"].setText(" ENG");
        me["Simple_L2S"].setText(" ACTIVE NAV DATA BASE");
        me["Simple_L3S"].setText(" SECOND NAV DATA BASE");
        me["Simple_L5S"].setText("CHG CODE");
        me["Simple_L6S"].setText("IDLE/PERF");
        me["Simple_R6"].setText("STATUS/XLOAD ");
        me["Simple_R6S"].setText("SOFTWARE ");
    } # page_switch
    me["Simple_L1"].setText(node.engType.getValue());
    me["Simple_L2"].setText(" " ~ node.database1.getValue());
    me["Simple_L3"].setText(" " ~ node.database2.getValue());
    me["Simple_R2"].setText(node.databaseCode.getValue() ~ " ");
};
