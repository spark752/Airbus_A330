# MCDU Radio Navigation Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var radnavPage = func(page_switch) {
    # Legacy variable names
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["Simple_Title"].setText("RADIO NAV");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].show();
        me["Simple_L6"].hide();
        me["Simple_L1S"].show();
        me["Simple_L2S"].show();
        me["Simple_L3S"].show();
        me["Simple_L4S"].show();
        me["Simple_L5S"].show();
        me["Simple_L6S"].hide();
        me["Simple_L1_Arrow"].hide();
        me["Simple_L2_Arrow"].hide();
        me["Simple_L3_Arrow"].hide();
        me["Simple_L4_Arrow"].hide();
        me["Simple_L5_Arrow"].hide();
        me["Simple_L6_Arrow"].hide();
        me["Simple_R1"].show();
        me["Simple_R2"].show();
        me["Simple_R3"].show();
        me["Simple_R4"].show();
        me["Simple_R5"].show();
        me["Simple_R6"].hide();
        me["Simple_R1S"].show();
        me["Simple_R2S"].show();
        me["Simple_R3S"].show();
        me["Simple_R4S"].show();
        me["Simple_R5S"].show();
        me["Simple_R6S"].hide();
        me["Simple_R1_Arrow"].hide();
        me["Simple_R2_Arrow"].hide();
        me["Simple_R3_Arrow"].hide();
        me["Simple_R4_Arrow"].hide();
        me["Simple_R5_Arrow"].hide();
        me["Simple_R6_Arrow"].hide();

        me.fontLeft(default, default, default, default, 0, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, symbol, symbol, 0, default);
        me.fontRightS(default, default, default, default, default, default);

        me.fontSizeLeft(0, 0, 0, 0, 0, normal);
        me.fontSizeRight(0, 0, small, small, 0, normal);

        me.colorLeft("blu", "blu", "blu", "blu", "blu", "blu");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorCenter("wht", "wht", "wht", "wht", "wht", "grn");
        me.colorCenterS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("blu", "blu", "blu", "blu", "blu", "blu");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L1S"].setText("VOR1/FREQ");
        me["Simple_L2S"].setText("CRS");
        me["Simple_L3S"].setText("ILS /FREQ");
        me["Simple_L4S"].setText("CRS");
        me["Simple_L5S"].setText("ADF1/FREQ");
        me["Simple_R3"].setText("[   ]/[    ]");
        me["Simple_R4"].setText("-.-   [   ]");
        me["Simple_R1S"].setText("FREQ/VOR2");
        me["Simple_R2S"].setText("CRS");
        me["Simple_R3S"].setText("CHAN/ MLS");
        me["Simple_R4S"].setText("SLOPE   CRS");
        me["Simple_R5S"].setText("FREQ/ADF2");
    } # page_switch

    var n = node.vor1FreqSet.getValue();
    if (n != me.radnav_change[0] or page_switch) {
        me.radnav_change[0] = n;
        if (n == 1) {
            me["Simple_L1"].setFontSize(normal);
        } else {
            me["Simple_L1"].setFontSize(small);
        }
    }
    n = node.vor1CRSSet.getValue();
    if (n != me.radnav_change[1] or page_switch) {
        me.radnav_change[1] = n;
        if (n == 1) {
            me["Simple_L2"].setFontSize(normal);
        } else {
            me["Simple_L2"].setFontSize(small);
        }
    }
    n = node.ils1FreqSet.getValue();
    if (n != me.radnav_change[2] or page_switch) {
        me.radnav_change[2] = n;
        if (n == 1) {
            me["Simple_L3"].setFontSize(normal);
        } else {
            me["Simple_L3"].setFontSize(small);
        }
    }
    n = node.ils1CRSSet.getValue();
    if (n != me.radnav_change[3] or page_switch) {
        me.radnav_change[3] = n;
        if (n == 1) {
            me["Simple_L4"].setFontSize(normal);
        } else {
            me["Simple_L4"].setFontSize(small);
        }
    }
    n = node.adf1FreqSet.getValue();
    if (n != me.radnav_change[4] or page_switch) {
        me.radnav_change[4] = n;
        if (n == 1) {
            me["Simple_L5"].setFont(default);
            me["Simple_L5"].setFontSize(normal);
            me["Simple_L5"].setText(node.adf1.getValue());
        } else {
            me["Simple_L5"].setFont(symbol);
            me["Simple_L5"].setFontSize(small);
            me["Simple_L5"].setText("[    ]/[     . ]");
        }
    }
    n = node.vor2FreqSet.getValue();
    if (n != me.radnav_change[5] or page_switch) {
        me.radnav_change[5] = n;
        if (n == 1) {
            me["Simple_R1"].setFontSize(normal);
        } else {
            me["Simple_R1"].setFontSize(small);
        }
    }
    n = node.vor2CRSSet.getValue();
    if (n != me.radnav_change[6] or page_switch) {
        me.radnav_change[6] = n;
        if (n == 1) {
            me["Simple_R2"].setFontSize(normal);
        } else {
            me["Simple_R2"].setFontSize(small);
        }
    }
    n = node.adf2FreqSet.getValue();
    if (n != me.radnav_change[7] or page_switch) {
        me.radnav_change[7] = n;
        if (n == 1) {
            me["Simple_R5"].setFont(default);
            me["Simple_R5"].setFontSize(normal);
            me["Simple_R5"].setText(node.adf2.getValue());
        } else {
            me["Simple_R5"].setFont(symbol);
            me["Simple_R5"].setFontSize(small);
            me["Simple_R5"].setText("[     . ]/[    ]");
        }
    }

    me["Simple_L1"].setText(" " ~ node.vor1.getValue());
    me["Simple_L2"].setText(sprintf("%3.0f", node.vor1CRS.getValue()));
    me["Simple_L3"].setText(" " ~ node.ils1.getValue());
    me["Simple_L4"].setText(sprintf("%3.0f", node.ils1CRS.getValue()));
    me["Simple_R1"].setText(" " ~ node.vor2.getValue());
    me["Simple_R2"].setText(sprintf("%3.0f", node.vor2CRS.getValue()));
};
