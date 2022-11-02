# A3XX MCDU

# Copyright (c) 2020 Josh Davidson (Octal450)

# Colours
var WHITE = [1.0000,1.0000,1.0000];
var GREEN = [0.0509,0.7529,0.2941];
var BLUE = [0.0901,0.6039,0.7176];
var AMBER = [0.7333,0.3803,0.0000];
var YELLOW = [0.9333,0.9333,0.0000];
var MAGENTA = [0.6902,0.3333,0.7541];

# Property nodes
var node = {
    acType: props.globals.getNode("/MCDUC/type", 1),
    engType: props.globals.getNode("/MCDUC/eng", 1),
    database1: props.globals.getNode("/FMGC/internal/navdatabase", 1),
    database2: props.globals.getNode("/FMGC/internal/navdatabase2", 1),
    databaseCode: props.globals.getNode(
        "/FMGC/internal/navdatabasecode", 1),
    vor1: props.globals.getNode("/FMGC/internal/vor1-mcdu", 1),
    vor2: props.globals.getNode("/FMGC/internal/vor2-mcdu", 1),
    ils1: props.globals.getNode("/FMGC/internal/ils1-mcdu", 1),
    adf1: props.globals.getNode("/FMGC/internal/adf1-mcdu", 1),
    adf2: props.globals.getNode("/FMGC/internal/adf2-mcdu", 1),
    vor1FreqSet: props.globals.getNode("/FMGC/internal/vor1freq-set", 1),
    vor1CRSSet: props.globals.getNode("/FMGC/internal/vor1crs-set", 1),
    vor2FreqSet: props.globals.getNode("/FMGC/internal/vor2freq-set", 1),
    vor2CRSSet: props.globals.getNode("/FMGC/internal/vor2crs-set", 1),
    ils1FreqSet: props.globals.getNode("/FMGC/internal/ils1freq-set", 1),
    ils1CRSSet: props.globals.getNode("/FMGC/internal/ils1crs-set", 1),
    adf1FreqSet: props.globals.getNode("/FMGC/internal/adf1freq-set", 1),
    adf2FreqSet: props.globals.getNode("/FMGC/internal/adf2freq-set", 1),
    ils1CRS: props.globals.getNode(
        "/instrumentation/nav[0]/radials/selected-deg", 1),
    vor1CRS: props.globals.getNode(
        "/instrumentation/nav[2]/radials/selected-deg", 1),
    vor2CRS: props.globals.getNode(
        "/instrumentation/nav[3]/radials/selected-deg", 1),
    flightNum: props.globals.getNode("/MCDUC/flight-num", 1),
    flightNumSet: props.globals.getNode("/MCDUC/flight-num-set", 1),
    depArpt: props.globals.getNode("/FMGC/internal/dep-arpt", 1),
    arrArpt: props.globals.getNode("/FMGC/internal/arr-arpt", 1),
    toFromSet: props.globals.getNode("/FMGC/internal/tofrom-set", 1),
    costIndex: props.globals.getNode("/FMGC/internal/cost-index", 1),
    costIndexSet: props.globals.getNode(
        "/FMGC/internal/cost-index-set", 1),
    cruiseFL: props.globals.getNode("/FMGC/internal/cruise-fl", 1),
    cruiseSet: props.globals.getNode("/FMGC/internal/cruise-lvl-set", 1),
    tropo: props.globals.getNode("/FMGC/internal/tropo", 1),
    tropoSet: props.globals.getNode("/FMGC/internal/tropo-set", 1),
    ADIRSMCDUBTN: props.globals.getNode("/controls/adirs/mcducbtn", 1),
    zfwcg: props.globals.getNode("/FMGC/internal/zfwcg", 1),
    zfwcgSet: props.globals.getNode("/FMGC/internal/zfwcg-set", 1),
    zfw: props.globals.getNode("/FMGC/internal/zfw", 1),
    zfwSet: props.globals.getNode("/FMGC/internal/zfw-set", 1),
    block: props.globals.getNode("/FMGC/internal/block", 1),
    blockSet: props.globals.getNode("/FMGC/internal/block-set", 1),
    state1: props.globals.getNode("/engines/engine[0]/state", 1),
    state2: props.globals.getNode("/engines/engine[1]/state", 1),
    engrdy: props.globals.getNode("/engines/ready", 1),
    v1: props.globals.getNode("/FMGC/internal/v1", 1),
    v1Set: props.globals.getNode("/FMGC/internal/v1-set", 1),
    vr: props.globals.getNode("/FMGC/internal/vr", 1),
    vrSet: props.globals.getNode("/FMGC/internal/vr-set", 1),
    v2: props.globals.getNode("/FMGC/internal/v2", 1),
    v2Set: props.globals.getNode("/FMGC/internal/v2-set", 1),
    clbReducFt: props.globals.getNode("/systems/thrust/clbreduc-ft", 1),
    reducFt: props.globals.getNode(
        "/FMGC/internal/reduc-agl-ft", 1), # It's not AGL anymore
    thrAccSet: props.globals.getNode("/MCDUC/thracc-set", 1),
    flapTO: props.globals.getNode("/FMGC/internal/to-flap", 1),
    THSTO: props.globals.getNode("/FMGC/internal/to-ths", 1),
    flapTHSSet: props.globals.getNode("/FMGC/internal/flap-ths-set", 1),
    flex: props.globals.getNode("/FMGC/internal/flex", 1),
    flexSet: props.globals.getNode("/FMGC/internal/flex-set", 1),
    engOutAcc: props.globals.getNode("/FMGC/internal/eng-out-reduc", 1),
    engOutAccSet: props.globals.getNode("/MCDUC/reducacc-set", 1),
    transAlt: props.globals.getNode("/FMGC/internal/trans-alt", 1),
    managedSpeed: props.globals.getNode(
        "/it-autoflight/input/spd-managed", 1),
    dest_qnh: props.globals.getNode("/FMGC/internal/dest-qnh", 1),
    dest_temp: props.globals.getNode("/FMGC/internal/dest-temp", 1),
    final: props.globals.getNode("/FMGC/internal/final", 1),
    radio: props.globals.getNode("/FMGC/internal/radio", 1),
    baro: props.globals.getNode("/FMGC/internal/baro", 1),
    weight_kgs_used: props.globals.getNode(
        "/systems/acconfig/options/weight-kgs", 1),
};

# Base class for MCDU canvas
var canvas_MCDU_base = {
    # Shared variables
    default_font: "HoneywellMCDU.ttf",
    small_font: "HoneywellMCDUSmall.ttf",
    normal_font_size: 60,
    small_font_size: 46,

    # Methods
    new: func(canvas_group, mcdu_index) {
        var m = {
            parents: [canvas_MCDU_base],
            index: mcdu_index,
            page_prop: props.globals.getNode(
                "/MCDU[" ~ mcdu_index ~ "]/page", 1),
            scratchpad_prop: props.globals.getNode(
                "/MCDU[" ~ mcdu_index ~ "]/scratchpad", 1),
            active_prop: props.globals.getNode(
                "/MCDU[" ~ mcdu_index ~ "]/active", 1),
            previous_page: "",
            radnav_change: [-1, -1, -1, -1, -1, -1, -1, -1],
        };
        m.init(canvas_group);
        return m;
    },
    init: func(canvas_group) {
        var font_mapper = func(family, weight) {
            return me.default_font;
        };
        canvas.parsesvg(canvas_group,
            "Aircraft/Airbus_A330/Models/Instruments/MCDU/res/mcdu.svg", {"font-mapper": font_mapper});
        var svg_keys = me.getKeys();
        foreach(var key; svg_keys) {
            me[key] = canvas_group.getElementById(key);
            var svg_keys = me.getKeys();

            foreach (var key; svg_keys) {
                me[key] = canvas_group.getElementById(key);

                var clip_el = canvas_group.getElementById(key ~ "_clip");
                if (clip_el != nil) {
                    clip_el.setVisible(0);
                    var tran_rect = clip_el.getTransformedBounds();
                    var clip_rect = sprintf("rect(%d,%d, %d,%d)",
                        tran_rect[1], # 0 ys
                        tran_rect[2], # 1 xe
                        tran_rect[3], # 2 ye
                        tran_rect[0]); #3 xs
                    # coordinates are top,right,bottom,left (ys, xe, ye, xs)
                    # ref: l621 of simgear/canvas/CanvasElement.cxx
                    me[key].set("clip", clip_rect);
                    me[key].set("clip-frame", canvas.Element.PARENT);
                }
            }
        }

        me["Simple_L1S"].setFont(me.small_font);
        me["Simple_L2S"].setFont(me.small_font);
        me["Simple_L3S"].setFont(me.small_font);
        me["Simple_L4S"].setFont(me.small_font);
        me["Simple_L5S"].setFont(me.small_font);
        me["Simple_L6S"].setFont(me.small_font);
        me["Simple_C1S"].setFont(me.small_font);
        me["Simple_C2S"].setFont(me.small_font);
        me["Simple_C3S"].setFont(me.small_font);
        me["Simple_C4S"].setFont(me.small_font);
        me["Simple_C5S"].setFont(me.small_font);
        me["Simple_C6S"].setFont(me.small_font);
        me["Simple_R1S"].setFont(me.small_font);
        me["Simple_R2S"].setFont(me.small_font);
        me["Simple_R3S"].setFont(me.small_font);
        me["Simple_R4S"].setFont(me.small_font);
        me["Simple_R5S"].setFont(me.small_font);
        me["Simple_R6S"].setFont(me.small_font);

        me["COCALLTUNE"].hide();
        me["COCALL"].hide();
        me["PRINTPAGE"].hide();
        me["ATISSend1"].hide();
        me["ATISSend2"].hide();
        me["ATISSend3"].hide();
        me["ATISSend4"].hide();
        me["NOTIFY"].hide();
        me["PERFAPPR_LDG_3"].hide();
        me["COMM-ADS"].hide();
        me["NOTIFY_FLTNBR"].hide();
        me["NOTIFY_AIRPORT"].hide();
        me["WEATHERREQSEND"].hide();
        me["MODEVHF3"].hide();
        me["ATISArrows"].hide();

        me.page = canvas_group;
        me.page.hide();

        return me;
    },
    getKeys: func() {
        return ["Simple","Simple_Center","Scratchpad","Simple_Title",
            "Simple_Title2","Simple_PageNum","ArrowLeft","ArrowRight",
            "Simple_L1","Simple_L2","Simple_L3","Simple_L4","Simple_L5",
            "Simple_L6","Simple_L0S","Simple_L1S","Simple_L2S","Simple_L3S",
            "Simple_L4S","Simple_L5S","Simple_L6S",
            "Simple_L1_Arrow","Simple_L2_Arrow","Simple_L3_Arrow",
            "Simple_L4_Arrow","Simple_L5_Arrow","Simple_L6_Arrow",
            "Simple_R1","Simple_R2","Simple_R3","Simple_R4","Simple_R5",
            "Simple_R6","Simple_R1S","Simple_R2S","Simple_R3S","Simple_R4S",
            "Simple_R5S","Simple_R6S","Simple_R1_Arrow","Simple_R2_Arrow",
            "Simple_R3_Arrow","Simple_R4_Arrow","Simple_R5_Arrow",
            "Simple_R6_Arrow","Simple_C1","Simple_C2","Simple_C3","Simple_C3B",
            "Simple_C4","Simple_C4B","Simple_C5","Simple_C6","Simple_C1S",
            "Simple_C2S","Simple_C3S","Simple_C4S","Simple_C5S","Simple_C6S",
            "INITA","INITA_CoRoute","INITA_FltNbr","INITA_CostIndex",
            "INITA_CruiseFLTemp","INITA_FromTo","INITA_InitRequest",
            "INITA_AlignIRS","INITB","INITB_ZFWCG","INITB_ZFW",
            "INITB_Block","FUELPRED","FUELPRED_ZFW","FUELPRED_ZFWCG",
            "FUELPRED_ZFWCG_S","PROG","PROG_UPDATE","PERFTO",
            "PERFTO_V1","PERFTO_VR","PERFTO_V2","PERFTO_FE","PERFTO_SE",
            "PERFTO_OE","PERFAPPR","PERFAPPR_FE","PERFAPPR_SE","PERFAPPR_OE",
            "PERFAPPR_LDG_3","PERFAPPR_LDG_F","PERFGA","PERFGA_FE","PERFGA_SE",
            "PERFGA_OE","FPLN","FPLN_From","FPLN_TMPY_group","FPLN_FROM",
            "FPLN_Callsign","departureTMPY","arrowsDepArr",
            "arrow1L","arrow2L","arrow3L","arrow4L","arrow5L",
            "arrow1R","arrow2R","arrow3R","arrow4R","arrow5R",
            "DIRTO_TMPY_group","IRSINIT","IRSINIT_1","IRSINIT_2",
            "IRSINIT_star","NOTIFY","NOTIFY_FLTNBR","NOTIFY_AIRPORT",
            "WEATHERREQSEND","WIND","WIND_CANCEL","WIND_INSERT_star",
            "WIND_UPDOWN","MODEVHF3","PRINTPAGE","COMM-ADS","COCALL",
            "COCALLTUNE","ATISSend1","ATISSend2","ATISSend3","ATISSend4",
            "ATISArrows",
        ];
    },
    visible: func() {
        # Override in derived class for unit power supply etc.
        return 1;
    },
    update: func() {
        # Page mapping
        var page_map = {
            "MCDU": menuPage,
            "STATUS": statusPage,
            "DATA": dataPage,
            "DATA2": data2Page,
            "POSMON": posmonPage,
            "RADNAV": radnavPage,
            "INITA": initAPage,
            "INITB": initBPage,
            "FUELPRED": fuelpredPage,
            "PERFTO": toPage,
            "PERFCLB": phasePage,
            "PERFCRZ": phasePage,
            "PERFDES": phasePage,
            "PERFAPPR": perfAPPRPage,
            "PERFGA": phasePage,
        };

        # Check if page switched since last time
        var page = me.page_prop.getValue();
        var page_switch = 0;
        if (page != me.previous_page) {
            page_switch = 1;
            me.previous_page = page;
        }

        # Use "call" API to call page functions within our namespace. This
        # allows them to be in separate files of reasonable length.
        var f = page_map[page];
        if (f != nil) {
            call(f, [page_switch], me);
        } else {
            if (page_switch) {
                me.defaultHide();
                me["Simple"].hide();
                me["ArrowLeft"].hide();
                me["ArrowRight"].hide();
            }
        }

        # Update scratchpad field from scratchpad
        me["Scratchpad"].setText(me.scratchpad_prop.getValue());
    },
    defaultHide: func() {
        me["Simple"].show();
        me["Simple_Center"].hide();
        me["Simple_Title2"].hide();
        me["FPLN"].hide();
        me["DIRTO_TMPY_group"].hide();
        me["INITA"].hide();
        me["IRSINIT"].hide();
        me["INITB"].hide();
        me["FUELPRED"].hide();
        me["WIND"].hide();
        me["PROG"].hide();
        me["PERFTO"].hide();
        me["arrowsDepArr"].hide();
        me["PERFAPPR"].hide();
        me["PERFGA"].hide();
        me["Simple_Title"].show();
        me["Simple_L0S"].hide();
        me["Simple_C3B"].hide();
        me["Simple_C4B"].hide();
    },
    defaultHideWithCenter: func() {
        me.defaultHide();
        me["Simple"].show();
        me["Simple_Center"].show();
    },
    defaultPageNumbers: func() {
        me["Simple_Title"].setColor(WHITE);
        me["Simple_PageNum"].setText("X/X");
        me["Simple_PageNum"].hide();
        me["ArrowLeft"].hide();
        me["ArrowRight"].hide();
    },
    color_map: {
        "wht": WHITE,
        "grn": GREEN,
        "blu": BLUE,
        "amb": AMBER,
        "yel": YELLOW,
        "mag": MAGENTA,
    }, # "ack" (or any other value not in map) = ignore
    colorLeft: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_L1"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_L2"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_L3"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_L4"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_L5"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_L6"].setColor(me.color_map[f]);
        }
    },
    colorLeftS: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_L1S"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_L2S"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_L3S"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_L4S"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_L5S"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_L6S"].setColor(me.color_map[f]);
        }
    },
    colorLeftArrow: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_L1_Arrow"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_L2_Arrow"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_L3_Arrow"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_L4_Arrow"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_L5_Arrow"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_L6_Arrow"].setColor(me.color_map[f]);
        }
    },
    colorRight: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_R1"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_R2"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_R3"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_R4"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_R5"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_R6"].setColor(me.color_map[f]);
        }
    },
    colorRightS: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_R1S"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_R2S"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_R3S"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_R4S"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_R5S"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_R6S"].setColor(me.color_map[f]);
        }
    },
    colorRightArrow: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_R1_Arrow"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_R2_Arrow"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_R3_Arrow"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_R4_Arrow"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_R5_Arrow"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_R6_Arrow"].setColor(me.color_map[f]);
        }
    },
    colorCenter: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_C1"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_C2"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_C3"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_C4"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_C5"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_C6"].setColor(me.color_map[f]);
        }
    },
    colorCenterS: func(a, b, c, d, e, f) {
        if (me.color_map[a] != nil) {
            me["Simple_C1S"].setColor(me.color_map[a]);
        }
        if (me.color_map[b] != nil) {
            me["Simple_C2S"].setColor(me.color_map[b]);
        }
        if (me.color_map[c] != nil) {
            me["Simple_C3S"].setColor(me.color_map[c]);
        }
        if (me.color_map[d] != nil) {
            me["Simple_C4S"].setColor(me.color_map[d]);
        }
        if (me.color_map[e] != nil) {
            me["Simple_C5S"].setColor(me.color_map[e]);
        }
        if (me.color_map[f] != nil) {
            me["Simple_C6S"].setColor(me.color_map[f]);
        }
    },
    fontSizeLeft: func (a, b, c, d, e, f) {
        if (a != 0) {
            me["Simple_L1"].setFontSize(a);
        }
        if (b != "ack") {
            me["Simple_L2"].setFontSize(b);
        }
        if (c != "ack") {
            me["Simple_L3"].setFontSize(c);
        }
        if (d != "ack") {
            me["Simple_L4"].setFontSize(d);
        }
        if (e != "ack") {
            me["Simple_L5"].setFontSize(e);
        }
        if (f != "ack") {
            me["Simple_L6"].setFontSize(f);
        }
    },
    fontSizeRight: func (a, b, c, d, e, f) {
        if (a != 0) {
            me["Simple_R1"].setFontSize(a);
        }
        if (b != 0) {
            me["Simple_R2"].setFontSize(b);
        }
        if (c != 0) {
            me["Simple_R3"].setFontSize(c);
        }
        if (d != 0) {
            me["Simple_R4"].setFontSize(d);
        }
        if (e != 0) {
            me["Simple_R5"].setFontSize(e);
        }
        if (f != 0) {
            me["Simple_R6"].setFontSize(f);
        }
    },
    fontSizeCenter: func (a, b, c, d, e, f) {
        if (a != 0) {
            me["Simple_C1"].setFontSize(a);
        }
        if (b != 0) {
            me["Simple_C2"].setFontSize(b);
        }
        if (c != 0) {
            me["Simple_C3"].setFontSize(c);
        }
        if (d != 0) {
            me["Simple_C4"].setFontSize(d);
        }
        if (e != 0) {
            me["Simple_C5"].setFontSize(e);
        }
        if (f != 0) {
            me["Simple_C6"].setFontSize(f);
        }
    },
    fontSizeCenterS: func (a, b, c, d, e, f) {
        if (a != 0) {
            me["Simple_C1S"].setFontSize(a);
        }
        if (b != 0) {
            me["Simple_C2S"].setFontSize(b);
        }
        if (c != 0) {
            me["Simple_C3S"].setFontSize(c);
        }
        if (d != 0) {
            me["Simple_C4S"].setFontSize(d);
        }
        if (e != 0) {
            me["Simple_C5S"].setFontSize(e);
        }
        if (f != 0) {
            me["Simple_C6S"].setFontSize(f);
        }
    },
};

# Controller for updating display
var MCDU_controller = {
    # Shared variables
    mcdu_obj: [],
    unit_to_update: 0,

    # Methods
    init: func() {
        # A330 should have 3 MCDUs but only 2 are currently implemented
        for (var i = 0; i < 2; i += 1) {
            var display = canvas.new({
                "name": "MCDU" ~ (i + 1),
                "size": [1024, 864],
                "view": [1024, 864],
                "mipmapping": 1
            });
            display.addPlacement({"node": "mcdu" ~ (i + 1) ~ ".screen"});
            var group = display.createGroup();
            append(me.mcdu_obj, canvas_MCDU_base.new(group, i));
        }

        # Each MCDU only operates if it has power and its screen is on
        var ac1 = props.globals.getNode("/systems/electrical/bus/ac1", 1);
        var lt1 = props.globals.getNode("/controls/lighting/DU/mcdu1", 1);
        me.mcdu_obj[0].visible = func() {
            (ac1.getValue() >= 110) and (lt1.getValue() > 0.01)
        };
        var ac2 = props.globals.getNode("/systems/electrical/bus/ac2", 1);
        var lt2 = props.globals.getNode("/controls/lighting/DU/mcdu2", 1);
        me.mcdu_obj[1].visible = func() {
            (ac2.getValue() >= 110) and (lt2.getValue() > 0.01)
        };
    },
    debug_total: 0, # DEBUG ONLY
    debug_count: 0, # DEBUG ONLY
    update: func() {
        var timestamp = maketimestamp(); # DEBUG ONLY
        me.unit_to_update += 1;
        if (me.unit_to_update >= size(me.mcdu_obj)) {
            me.unit_to_update = 0;
        }
        var i = me.unit_to_update;
        if (me.mcdu_obj[i].visible()) {
            me.mcdu_obj[i].update();
            me.mcdu_obj[i].page.show();

            # DEBUG ONLY: Does nothing useful if print is commented out.
            # Otherwise spams console and log with timing info. Will be
            # removed later.
            me.debug_total = me.debug_total + timestamp.elapsedUSec();
            me.debug_count = me.debug_count + 1;
            if (me.debug_count > 100) {
                #print(me.debug_total / me.debug_count, "uSec ave");
                me.debug_count = 0;
                me.debug_total = 0;
            }
        } else {
            me.mcdu_obj[i].page.hide();
        }
    },
};

setlistener("sim/signals/fdm-initialized", func {
    MCDU_controller.init();
    MCDU_timer.start();
});

# Only one MCDU is updated for each timer event. Unlike the ECAMs, the interval
# is not controlled by a quality setting but it can be fairly slow since the
# information displayed does not usually change rapidly.
var MCDU_timer = maketimer(0.065, func {
    MCDU_controller.update();
});

# Called by A330-main.xml to display the canvas as a popup
var showMCDU1 = func {
    gui.showDialog("mcdu1");
};
var showMCDU2 = func {
    gui.showDialog("mcdu2");
};
