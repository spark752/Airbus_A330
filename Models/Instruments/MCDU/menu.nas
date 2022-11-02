# MCDU Menu Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var menuPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("MCDU MENU");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        showLeft(me, 1, 1, 1, 1, -1, -1);
        showLeftS(me, -1, -1, -1, -1, -1, -1);
        showRight(me, -1, -1, -1, -1, -1, 1);
        showRightS(me, -1, -1, -1, -1, -1, -1);
        showLeftArrow(me, 1, 1, 1, 1, -1, -1);
        showRightArrow(me, -1, -1, -1, -1, -1, 1);

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
        me["Simple_L1"].setColor(BLUE);
    } else if (me.active_prop.getValue() == 2) {
        me["Simple_L1"].setText(" FMGC");
        me["Simple_L1"].setColor(GREEN);
    } else {
        me["Simple_L1"].setText(" FMGC");
        me["Simple_L1"].setColor(WHITE);
    }
};

var statusPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("    " ~ node.acType.getValue());
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        showLeft(me, 1, 1, 1, -1, 1, 1);
        showLeftS(me, 1, 1, 1, -1, 1, 1);
        showRight(me, -1, 1, -1, -1, -1, 1);
        showRightS(me, -1, -1, -1, -1, -1, 1);
        showLeftArrow(me, -1, -1, 1, -1, -1, -1);
        showRightArrow(me, -1, 1, -1, -1, -1, 1);

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
