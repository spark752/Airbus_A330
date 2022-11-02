# MCDU Init Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var initAPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["INITA"].show();
        me["Simple_Title"].setText("INIT");
        me["Simple_PageNum"].hide();

        showLeft(me, -1, 1, -1, 1, -1, 1);
        showLeftS(me, 1, 1, 1, 1, 1, 1);
        showRight(me, -1, -1, -1, 1, 1, 1);
        showRightS(me, 1, -1, -1, 1, -1, 1);
        showLeftArrow(me, -1, -1, -1, -1, -1, -1);
        showRightArrow(me, -1, -1, -1, -1, 1, -1);

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
        me["Simple_L5"].setColor(WHITE);
        me["Simple_L5"].show();
        me["Simple_L5"].setText("---");
    } else if (node.costIndexSet.getValue() == 1) {
        me["INITA_CostIndex"].hide();
        me["Simple_L5"].setColor(BLUE);
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
        me["Simple_L6"].setColor(WHITE);
        me["Simple_L6"].setText("-----/---°");
    } else if (node.cruiseSet.getValue() == 1) {
        me["INITA_CruiseFLTemp"].hide();
        me["Simple_L6"].setColor(BLUE);
        me["Simple_L6"].setText("FL" ~
            node.cruiseFL.getValue() ~ "/---°");
    } else {
        me["INITA_CruiseFLTemp"].show();
        me["Simple_L6"].setColor(AMBER);
        me["Simple_L6"].setText("         °");
    }
    if (node.toFromSet.getValue() == 1) {
        me["INITA_CoRoute"].hide();
        me["INITA_FromTo"].hide();
        me["Simple_L1"].show();
        me["Simple_L2"].setColor(BLUE);
        me["Simple_L2"].setText("NONE");
        me["Simple_R1"].show();
        me["Simple_R2"].hide();
        me["Simple_R2S"].hide();
        me["INITA_InitRequest"].hide();
    } else {
        me["INITA_CoRoute"].show();
        me["INITA_FromTo"].show();
        me["Simple_L1"].hide();
        me["Simple_L2"].setColor(WHITE);
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
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHide();
        me["INITB"].show();
        me["Simple_Title"].setText("INIT");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].show();
        me["ArrowRight"].show();

        showLeft(me, 1, 1, 1, 1, 1, 1);
        showLeftS(me, 1, 1, 1, 1, 1, 1);
        showRight(me, 1, 1, -1, 1, 1, -1);
        showRightS(me, 1, 1, -1, 1, 1, -1);
        showLeftArrow(me, -1, -1, -1, -1, -1, -1);
        showRightArrow(me, -1, -1, -1, -1, -1, -1);

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

        # This was previously ZFWCG/ZFW order which matches older documentation
        # but ZFW/ZFWCG seems to be used on newer MCDU software. Ref Airbus
        # "Safety first #08 July 2009"
        me["Simple_R1S"].setText("ZFW/ZFWCG");
    } # page_switch
    var zfw = node.zfw.getValue();
    if (node.weight_kgs_used.getValue()) {
        zfw = zfw * LB2KG;
    }
    if (node.zfwSet.getValue() == 1) {
        if (node.zfwcgSet.getValue() == 1) {
            me["INITB_ZFW"].hide();
            me["INITB_ZFWCG"].hide();
            me["Simple_R1"].setText(sprintf("%3.1f/%3.1f", zfw,
                node.zfwcg.getValue()));
        } else {
            me["INITB_ZFW"].hide();
            me["INITB_ZFWCG"].show();
            me["Simple_R1"].setText(sprintf("%3.1f     ", zfw));
        }
    } else {
        if (node.zfwcgSet.getValue() == 1) {
            me["INITB_ZFW"].show();
            me["INITB_ZFWCG"].hide();
            me["Simple_R1"].setText(sprintf("    /%3.1f",
                node.zfwcg.getValue()));
        } else {
            me["INITB_ZFW"].show();
            me["INITB_ZFWCG"].show();
            me["Simple_R1"].setText("         ");
        }
    }
    var block = node.block.getValue();
    if (node.weight_kgs_used.getValue()) {
        block = block * LB2KG;
    }
    me["Simple_R2"].setText(sprintf("%3.1f", block));
    if (node.blockSet.getValue() == 1) {
        me["INITB_Block"].hide();
        me["Simple_R2"].show();
    } else {
        me["INITB_Block"].show();
        me["Simple_R2"].hide();
    }
};
