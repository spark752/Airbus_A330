# MCDU Init Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var initAPage = func(page_switch) {
    # Legacy variable names
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["INITA"].show();
        me["Simple_Title"].setText("INIT");
        me["Simple_PageNum"].hide();

        me["Simple_L2"].show();
        me["Simple_L4"].show();
        me["Simple_L6"].show();
        me["Simple_L1S"].show();
        me["Simple_L2S"].show();
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
        me["Simple_R4"].show();
        me["Simple_R5"].show();
        me["Simple_R6"].show();
        me["Simple_R1S"].show();
        me["Simple_R3S"].hide();
        me["Simple_R4S"].show();
        me["Simple_R5S"].hide();
        me["Simple_R6S"].show();
        me["Simple_R1_Arrow"].hide();
        me["Simple_R2_Arrow"].hide();
        me["Simple_R3_Arrow"].hide();
        me["Simple_R4_Arrow"].hide();
        me["Simple_R5_Arrow"].show();
        me["Simple_R6_Arrow"].hide();

        me.fontLeft(default, default, default, default, default, default);
        me.fontLeftS(default, default, default, default, default, default);
        me.fontRight(default, default, default, default, default, default);
        me.fontRightS(default, default, default, default, default, default);

        me.fontSizeLeft(normal, normal, normal, normal, normal, normal);
        me.fontSizeRight(normal, normal, normal, normal, normal, 0);

        me.colorLeft("blu", "wht", "blu", "blu", "ack", "ack");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("blu", "amb", "amb", "blu", "wht", "blu");
        me.colorRightS("wht", "amb", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L1S"].setText(" CO RTE");
        me["Simple_L2S"].setText("ALTN/CO RTE");
        me["Simple_L3S"].setText("FLT NBR");
        me["Simple_L4S"].setText("LAT");
        me["Simple_L5S"].setText("COST INDEX");
        me["Simple_L6S"].setText("CRZ FL/TEMP");
        me["Simple_L1"].setText("NONE");
        me["Simple_L4"].setText("----.-");
        me["Simple_R1S"].setText("FROM/TO   ");
        me["Simple_R2S"].setText("INIT ");
        me["Simple_R4S"].setText("LONG");
        me["Simple_R6S"].setText("TROPO");
        me["Simple_R2"].setText("REQUEST ");
        me["Simple_R3"].setText("ALIGN IRS ");
        me["Simple_R4"].setText("-----.--");
        me["Simple_R5"].setText("WIND ");
    } # page_switch
    if (node.state1.getValue() != 3 and node.state2.getValue() != 3) {
        me["ArrowLeft"].show();
        me["ArrowRight"].show();
    } else {
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();
    }
    if (node.flightNumSet.getValue() == 1) {
        me["INITA_FltNbr"].hide();
        me["Simple_L3"].show();
    } else {
        me["INITA_FltNbr"].show();
        me["Simple_L3"].hide();
    }
    if (node.toFromSet.getValue() != 1 and
            node.costIndexSet.getValue() != 1) {
        me["INITA_CostIndex"].hide();
        me["Simple_L5"].setColor(1,1,1);
        me["Simple_L5"].show();
        me["Simple_L5"].setText("---");
    } else if (node.costIndexSet.getValue() == 1) {
        me["INITA_CostIndex"].hide();
        me["Simple_L5"].setColor(0.0901,0.6039,0.7176);
        me["Simple_L5"].show();
        me["Simple_L5"].setText(sprintf("%3.0f",
            node.costIndex.getValue()));
    } else {
        me["INITA_CostIndex"].show();
        me["Simple_L5"].hide();
    }
    if (node.toFromSet.getValue() != 1 and
            node.cruiseSet.getValue() != 1) {
        me["INITA_CruiseFLTemp"].hide();
        me["Simple_L6"].setColor(1,1,1);
        me["Simple_L6"].setText("-----/---g");
    } else if (node.cruiseSet.getValue() == 1) {
        me["INITA_CruiseFLTemp"].hide();
        me["Simple_L6"].setColor(0.0901,0.6039,0.7176);
        me["Simple_L6"].setText("FL" ~
            node.cruiseFL.getValue() ~ "/---g");
    } else {
        me["INITA_CruiseFLTemp"].show();
        me["Simple_L6"].setColor(0.7333,0.3803,0);
        me["Simple_L6"].setText("         g");
    }
    if (node.toFromSet.getValue() == 1) {
        me["INITA_CoRoute"].hide();
        me["INITA_FromTo"].hide();
        me["Simple_L1"].show();
        me["Simple_L2"].setColor(0.0901,0.6039,0.7176);
        me["Simple_L2"].setText("NONE");
        me["Simple_R1"].show();
        me["Simple_R2"].hide();
        me["Simple_R2S"].hide();
        me["INITA_InitRequest"].hide();
    } else {
        me["INITA_CoRoute"].show();
        me["INITA_FromTo"].show();
        me["Simple_L1"].hide();
        me["Simple_L2"].setColor(1,1,1);
        me["Simple_L2"].setText("----/----------");
        me["Simple_R1"].hide();
        me["Simple_R2"].show();
        me["Simple_R2S"].show();
        me["INITA_InitRequest"].show();
    }
    if (node.toFromSet.getValue() == 1 and
            node.ADIRSMCDUBTN.getValue() != 1) {
        me["INITA_AlignIRS"].show();
        me["Simple_R3"].show();
    } else {
        me["INITA_AlignIRS"].hide();
        me["Simple_R3"].hide();
    }
    if (node.tropoSet.getValue() == 1) {
        me["Simple_R6"].setFontSize(normal);
    } else {
        me["Simple_R6"].setFontSize(small);
    }

    me["Simple_L3"].setText(node.flightNum.getValue());
    me["Simple_R1"].setText(
        node.depArpt.getValue() ~ "/" ~
        node.arrArpt.getValue());
    me["Simple_R6"].setText(sprintf("%5.0f", node.tropo.getValue()));
};

var initBPage = func(page_switch) {
    # Legacy variable names
    var default = me.default_font;
    var symbol = me.symbol_font;
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["Simple_Center"].show();
        me["INITB"].show();
        me["Simple_Title"].setText("INIT");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].show();
        me["ArrowRight"].show();

        me["Simple_L1"].show();
        me["Simple_L2"].show();
        me["Simple_L3"].show();
        me["Simple_L4"].show();
        me["Simple_L5"].show();
        me["Simple_L6"].show();
        me["Simple_L1S"].show();
        me["Simple_L2S"].show();
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
        me["Simple_C2"].hide();
        me["Simple_C3"].hide();
        me["Simple_C4"].hide();
        me["Simple_C5"].hide();
        me["Simple_C6"].hide();
        me["Simple_C1S"].hide();
        me["Simple_C2S"].hide();
        me["Simple_C3S"].hide();
        me["Simple_C4S"].hide();
        me["Simple_C5S"].hide();
        me["Simple_C6S"].hide();
        me["Simple_R1"].hide();
        me["Simple_R2"].show();
        me["Simple_R3"].hide();
        me["Simple_R4"].show();
        me["Simple_R5"].show();
        me["Simple_R6"].hide();
        me["Simple_R1S"].show();
        me["Simple_R2S"].show();
        me["Simple_R3S"].hide();
        me["Simple_R4S"].show();
        me["Simple_R5S"].show();
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

        me.colorLeft("blu", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorCenter("blu", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("blu", "blu", "wht", "wht", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L1"].setText("0.2");
        me["Simple_L2"].setText("---.-/----");
        me["Simple_L3"].setText("---.-/--.-");
        me["Simple_L4"].setText("---.-/----");
        me["Simple_L5"].setText("---.-/----");
        me["Simple_L6"].setText("---.-/----");
        me["Simple_L1S"].setText("TAXI");
        me["Simple_L2S"].setText("TRIP/TIME");
        me["Simple_L3S"].setText("RTE RSV/");
        me["Simple_L4S"].setText("ALTN/TIME");
        me["Simple_L5S"].setText("FINAL/TIME");
        me["Simple_L6S"].setText("EXTRA/TIME");
        me["Simple_R4"].setText("---.-");
        me["Simple_R5"].setText("---.-");
        me["Simple_R2S"].setText("BLOCK");
        me["Simple_R4S"].setText("TOW");
        me["Simple_R5S"].setText("LW");

        # Fields in this order in the documentation and videos that I've seen
        me["Simple_R1S"].setText("ZFWCG/   ZFW");
    } # page_switch

    if (node.zfwcgSet.getValue() == 1) {
        me["Simple_C1"].setFontSize(normal);
        me["Simple_C1"].setText(
            "        " ~ sprintf("%3.1f", node.zfwcg.getValue()));
        me["INITB_ZFWCG"].hide();
    } else {
        me["Simple_C1"].setFontSize(small);
        me["Simple_C1"].setText(
            "           " ~ sprintf("%3.1f", node.zfwcg.getValue()));
        me["INITB_ZFWCG"].hide();
    }

    if (node.zfwSet.getValue() == 1) {
        me["INITB_ZFW"].hide();
        me["INITB_ZFWCG_S"].show();
        me["Simple_R1"].show();
    } else {
        me["INITB_ZFW"].show();
        me["INITB_ZFWCG_S"].hide();
        me["Simple_R1"].hide();
    }

    if (node.blockSet.getValue() == 1) {
        me["INITB_Block"].hide();
        me["Simple_R2"].show();
    } else {
        me["INITB_Block"].show();
        me["Simple_R2"].hide();
    }

    me["Simple_R1"].setText(sprintf("%3.1f", node.zfw.getValue()));
    me["Simple_R2"].setText(sprintf("%3.1f", node.block.getValue()));
};
