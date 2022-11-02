# MCDU Performance Page UI

# Functions will be called within the namespace of canvas_MCDU_base
var toPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["PERFTO"].show();
        me["Simple_Title"].setText("TAKE OFF");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        showLeft(me, 1, 1, 1, 1, 1, 1);
        showLeftS(me, 1, 1, 1, 1, 1, 1);
        showRight(me, 1, 1, 1, 1, 1, 1);
        showRightS(me, 1, 1, 1, 1, 1, 1);
        showLeftArrow(me, -1, -1, -1, -1, -1, 1);
        showRightArrow(me, -1, -1, -1, -1, -1, 1);
        showCenter(me, -1, -1, -1, -1, -1, -1);
        showCenterS(me, 1, 1, 1, -1, -1, -1);

        me.fontSizeLeft(normal, normal, normal, normal, 0, normal);
        me.fontSizeRight(normal, small, 0, 0, 0, normal);

        me.colorLeft("blu", "blu", "blu", "blu", "blu", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("wht", "blu", "blu", "blu", "blu", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorCenter("grn", "grn", "grn", "wht", "wht", "wht");
        me.colorCenterS("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L6"].setText(" TO DATA");
        me["Simple_L1S"].setText(" V1");
        me["Simple_L2S"].setText(" VR");
        me["Simple_L3S"].setText(" V2");
        me["Simple_L4S"].setText("TRANS ALT");
        me["Simple_L5S"].setText("THR RED/ACC");
        me["Simple_L6S"].setText(" UPLINK");
        me["Simple_R1"].setText("--- ");
        me["Simple_R2"].setText("[    ]  ");
        me["Simple_R6"].setText("PHASE ");
        me["Simple_R1S"].setText("RWY ");
        me["Simple_R2S"].setText("TO SHIFT ");
        me["Simple_R3S"].setText("FLAPS/THS");
        me["Simple_R4S"].setText("FLEX TO TEMP");
        me["Simple_R5S"].setText("ENG OUT ACC");
        me["Simple_R6S"].setText("NEXT ");
        me["Simple_C1S"].setText("FLP RETR        ");
        me["Simple_C2S"].setText("SLT RETR        ");
        me["Simple_C3S"].setText("CLEAN      ");
    } # page_switch

    if (node.v1Set.getValue() == 1) {
        me["PERFTO_V1"].hide();
        me["Simple_L1"].show();
    } else {
        me["PERFTO_V1"].show();
        me["Simple_L1"].hide();
    }
    if (node.vrSet.getValue() == 1) {
        me["PERFTO_VR"].hide();
        me["Simple_L2"].show();
    } else {
        me["PERFTO_VR"].show();
        me["Simple_L2"].hide();
    }
    if (node.v2Set.getValue() == 1) {
        me["PERFTO_V2"].hide();
        me["Simple_L3"].show();
    } else {
        me["PERFTO_V2"].show();
        me["Simple_L3"].hide();
    }
    if (node.thrAccSet.getValue() == 1) {
        me["Simple_L5"].setFontSize(normal);
    } else {
        me["Simple_L5"].setFontSize(small);
    }
    if (node.flapTHSSet.getValue() == 1) {
        me["Simple_R3"].setFontSize(normal);
        me["Simple_R3"].setText(
            node.flapTO.getValue() ~ "/UP" ~
            node.THSTO.getValue());
    } else {
        me["Simple_R3"].setFontSize(small);
        me["Simple_R3"].setText("[  ]/[      ]");
    }
    if (node.flexSet.getValue() == 1) {
        me["Simple_R4"].setFontSize(normal);
        me["Simple_R4"].setText(sprintf("%3.0f",
            node.flex.getValue()));
    } else {
        me["Simple_R4"].setFontSize(small);
        me["Simple_R4"].setText("[   ]");
    }
    if (node.engOutAccSet.getValue() == 1) {
        me["Simple_R5"].setFontSize(normal);
    } else {
        me["Simple_R5"].setFontSize(small);
    }

    me["Simple_L1"].setText(sprintf("%3.0f", node.v1.getValue()));
    me["Simple_L2"].setText(sprintf("%3.0f", node.vr.getValue()));
    me["Simple_L3"].setText(sprintf("%3.0f", node.v2.getValue()));
    me["Simple_L4"].setText(sprintf("%3.0f",
        node.transAlt.getValue()));
    me["Simple_L5"].setText(node.clbReducFt.getValue() ~
        "/" ~ node.reducFt.getValue()); # Both are strings
    me["Simple_R5"].setText(sprintf("%3.0f",
        node.engOutAcc.getValue()));
};

var phasePage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    var page = me.page_prop.getValue();
    if (page_switch) {
        me.defaultHideWithCenter();
        if (page == "PERFGA") {
            me["Simple_Title"].setText("GO AROUND");
        } else {
            me["Simple_Title"].setText(substr(page, 4)); # Skip "PERF" part
        }
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();

        showLeft(me, 1, 1, 1, -1, -1, 1);
        showLeftS(me, 1, 1, 1, -1, -1, 1);
        showRight(me, 1, -1, -1, -1, -1, 1);
        showRightS(me, 1, -1, -1, -1, -1, 1);
        showLeftArrow(me, -1, -1, -1, -1, -1, 1);
        showRightArrow(me, -1, -1, -1, -1, -1, 1);
        showCenter(me, 1, -1, -1, -1, -1, -1);
        showCenterS(me, 1, -1, -1, -1, -1, -1);

        me.fontSizeLeft(normal, normal, small, small, normal, normal);
        me.fontSizeRight(normal, normal, normal, normal, small, normal);
        me.fontSizeCenter(normal, normal, normal, normal, small, normal);

        me.colorLeft("grn", "ack", "grn", "blu", "wht", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorCenter("wht", "wht", "wht", "wht", "blu", "wht");
        me.colorCenterS("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_L3"].setText("");
        me["Simple_L4"].setText(" [    ]");
        me["Simple_L6"].setText(" PHASE");
        me["Simple_L1S"].setText("ACT MODE");
        me["Simple_L2S"].setText(" CI");
        me["Simple_L3S"].setText(" MANAGED");
        me["Simple_L4S"].setText(" PRESEL");
        me["Simple_L6S"].setText(" PREV");
        me["Simple_R1"].setText("---");
        me["Simple_R5"].setText("FT/MIN");
        me["Simple_R6"].setText("PHASE ");
        me["Simple_R1S"].setText("DES EFOB");
        me["Simple_R5S"].setText("DES CABIN RATE");
        me["Simple_R6S"].setText("NEXT ");
        me["Simple_C1"].setText("---  ");
        me["Simple_C5"].setText("             -350");
        me["Simple_C1S"].setText("TIME  ");
    } # page_switch

    if (node.managedSpeed.getValue() == 1) {
        me["Simple_L1"].setText("MANAGED");
    } else {
        me["Simple_L1"].setText("SELECTED");
    }

    if (node.costIndexSet.getValue() == 1) {
        me["Simple_L2"].setColor(BLUE);
        me["Simple_L2"].setText(sprintf("%3.0f",
            node.costIndex.getValue()));
    } else {
        me["Simple_L2"].setColor(WHITE);
        me["Simple_L2"].setText("---");
    }

    if (page == "PERFCRZ") {
        me["Simple_R5"].show();
        me["Simple_R5S"].show();
        me["Simple_C5"].show();
    } else {
        me["Simple_R5"].hide();
        me["Simple_R5S"].hide();
        me["Simple_C5"].hide();
    }
};

var perfAPPRPage = func(page_switch) {
    # Legacy variable names
    var normal = me.normal_font_size;
    var small = me.small_font_size;

    if (page_switch) {
        me.defaultHideWithCenter();
        me["PERFAPPR"].show();
        me["Simple_Title"].setText("APPR");
        me.defaultPageNumbers();

        showLeft(me, 1, 1, 1, 1, 1, 1);
        showLeftS(me, 1, 1, 1, 1, 1, 1);
        showRight(me, 1, 1, 1, 1, 1, 1);
        showRightS(me, 1, 1, 1, 1, -1, 1);
        showLeftArrow(me, -1, -1, -1, -1, -1, 1);
        showRightArrow(me, -1, -1, -1, -1, -1, 1);
        showCenter(me, 1, 1, 1, -1, 1, -1);
        showCenterS(me, 1, 1, 1, -1, 1, -1);
        me["Simple_L0S"].show();        
        me["Simple_C3B"].hide();
        me["Simple_C4B"].hide();
        
        me.fontSizeLeft(small, small, small, small, small, normal);
        me.fontSizeRight(normal, small, small, small, normal, normal);
        me.fontSizeCenter(small, small, small, 0, small, 0);
        me.fontSizeCenterS(small, small, small, small, small, small);

        me.colorLeft("blu", "blu", "blu", "blu", "blu", "wht");
        me.colorLeftS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorLeftArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRight("wht", "blu", "blu", "blu", "blu", "wht");
        me.colorRightS("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorRightArrow("wht", "wht", "wht", "wht", "wht", "wht");
        me.colorCenter("grn", "grn", "grn", "wht", "grn", "wht");
        me.colorCenterS("wht", "wht", "wht", "wht", "wht", "wht");

        me["Simple_C1S"].setText("FLP RETR");
        me["Simple_C2S"].setText("SLT RETR");
        me["Simple_C3S"].setText("  CLEAN");
        me["Simple_C5S"].setText("VLS");
        me["Simple_L0S"].setText("DEST");
        me["Simple_L1S"].setText(" QNH");
        me["Simple_L2S"].setText("TEMP");
        me["Simple_L3S"].setText("MAG WIND");
        me["Simple_L4S"].setText("TRANS FL");
        me["Simple_R1S"].setText("FINAL");
        me["Simple_R2S"].setText("BARO");
        me["Simple_R3S"].setText("RADIO ");
        me["Simple_R4S"].setText("LDG CONF ");
        me["Simple_R4"].setText("CONF3 ");
        me["Simple_R5"].setText("FULL ");
        me["Simple_L6S"].setText(" PREV");
        me["Simple_L6"].setText(" PHASE");
        me["Simple_R6S"].setText("NEXT ");
        me["Simple_R6"].setText("PHASE ");
        me["Simple_L5S"].setText(" VAPP");
        me["Simple_C5"].setText("");
        me["Simple_C3B"].setText("");
    }
    var dest_qnh = node.dest_qnh.getValue();
    if (dest_qnh != -1) {
        if (dest_qnh < 100) {
            me["Simple_L1"].setText(sprintf("%4.2f", dest_qnh));
        } else {
            me["Simple_L1"].setText(sprintf("%4.0f", dest_qnh));
        }
    } else {
        me["Simple_L1"].setText("[   ]");
    }
    var dest_temp = node.dest_temp.getValue();
    if (dest_temp != -999) {
        me["Simple_L2"].setText(sprintf("%3.0f°", dest_temp));
    } else {
        me["Simple_L2"].setText("[ ]°");
    }

    # Most of the information is not yet available
};
