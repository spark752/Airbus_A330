# A3XX Lower ECAM Canvas

# Copyright (c) 2020 Josh Davidson (Octal450)

var lowerECAM_apu = nil;
var lowerECAM_eng = nil;
var lowerECAM_fctl = nil;
var lowerECAM_sts = nil;
var lowerECAM_elec = nil;
var lowerECAM_test = nil;
var lowerECAM_display = nil;
var elapsedtime = 0;
setprop("/systems/electrical/extra/apu-load", 0);
setprop("/systems/electrical/extra/apu-volts", 0);
setprop("/systems/electrical/extra/apu-hz", 0);
setprop("/systems/pneumatic/bleedapu", 0);
setprop("/engines/engine[0]/oil-psi-actual", 0);
setprop("/engines/engine[1]/oil-psi-actual", 0);
setprop("/ECAM/Lower/APU-N", 0);
setprop("/ECAM/Lower/APU-EGT", 0);
setprop("/ECAM/Lower/Oil-QT[0]", 0);
setprop("/ECAM/Lower/Oil-QT[1]", 0);
setprop("/ECAM/Lower/Oil-PSI[0]", 0);
setprop("/ECAM/Lower/Oil-PSI[1]", 0);
setprop("/ECAM/Lower/aileron-ind-in-left", 0);
setprop("/ECAM/Lower/aileron-ind-in-right", 0);
setprop("/ECAM/Lower/aileron-ind-out-left", 0);
setprop("/ECAM/Lower/aileron-ind-out-right", 0);
setprop("/ECAM/Lower/elevator-ind-left", 0);
setprop("/ECAM/Lower/elevator-ind-right", 0);
setprop("/ECAM/Lower/elevator-trim-deg", 0);
setprop("/fdm/jsbsim/hydraulics/rudder/final-deg", 0);
setprop("/environment/temperature-degc", 0);
setprop("/FMGC/internal/gw", 0);
setprop("/instrumentation/du/du4-test", 0);
setprop("/instrumentation/du/du4-test-time", 0);
setprop("/instrumentation/du/du4-test-amount", 0);

# A330-main.xml puts this in the same namespace as Upper-ECAM.nas which
# includes definitions for:
# LBS2KGS
# acconfig_weight_kgs

var canvas_lowerECAM_base = {
    init: func(canvas_group, file) {
        var font_mapper = func(family, weight) {
            return "LiberationFonts/LiberationSans-Regular.ttf";
        };

        canvas.parsesvg(canvas_group, file, {"font-mapper": font_mapper});

        var svg_keys = me.getKeys();
        foreach(var key; svg_keys) {
            me[key] = canvas_group.getElementById(key);
        }

        me.page = canvas_group;

        return me;
    },
    getKeys: func() {
        return [];
    },
    update: func() {
        elapsedtime = getprop("/sim/time/elapsed-sec");
        if (getprop("/systems/electrical/bus/ac2") >= 110) {
            if (getprop("/gear/gear[0]/wow") == 1) {
                if (getprop("/systems/acconfig/autoconfig-running") != 1 and getprop("/instrumentation/du/du4-test") != 1) {
                    setprop("/instrumentation/du/du4-test", 1);
                    setprop("/instrumentation/du/du4-test-amount", math.round((rand() * 5 ) + 35, 0.1));
                    setprop("/instrumentation/du/du4-test-time", getprop("/sim/time/elapsed-sec"));
                } else if (getprop("/systems/acconfig/autoconfig-running") == 1 and getprop("/instrumentation/du/du4-test") != 1) {
                    setprop("/instrumentation/du/du4-test", 1);
                    setprop("/instrumentation/du/du4-test-amount", math.round((rand() * 5 ) + 35, 0.1));
                    setprop("/instrumentation/du/du4-test-time", getprop("/sim/time/elapsed-sec") - 30);
                }
            } else {
                setprop("/instrumentation/du/du4-test", 1);
                setprop("/instrumentation/du/du4-test-amount", 0);
                setprop("/instrumentation/du/du4-test-time", -100);
            }
        } else if (getprop("/systems/electrical/ac1-src") == "XX" or getprop("/systems/electrical/ac2-src") == "XX") {
            setprop("/instrumentation/du/du4-test", 0);
        }
        
        if (getprop("/systems/electrical/bus/ac2") >= 110 and getprop("/controls/lighting/DU/du4") > 0.01) {
            if (getprop("/instrumentation/du/du4-test-time") + getprop("/instrumentation/du/du4-test-amount") >= elapsedtime) {
                me.hideAllPages();
                lowerECAM_test.page.show();
                lowerECAM_test.update();
            } else {
                lowerECAM_test.page.hide();
                var page = getprop("/ECAM/Lower/page");
                var previous_page = getprop("/ECAM/Lower/previous_page");
                if (page != previous_page) {
                    if (previous_page == "apu") {
                        lowerECAM_apu.page.hide();
                    } else if (previous_page == "eng") {
                        lowerECAM_eng.page.hide();
                    } else if (previous_page == "fctl") {
                        lowerECAM_fctl.page.hide();
                    } else if (previous_page == "elec") {
                        lowerECAM_elec.page.hide();
                    } else {
                        lowerECAM_sts.page.hide();
                    }
                    setprop("/ECAM/Lower/previous_page", page);
                }
                if (page == "apu") {
                    lowerECAM_apu.page.show();
                    lowerECAM_apu.update();
                } else if (page == "eng") {
                    lowerECAM_eng.page.show();
                    lowerECAM_eng.update();
                } else if (page == "fctl") {
                    lowerECAM_fctl.page.show();
                    lowerECAM_fctl.update();
                } else if (page == "elec") {
                    lowerECAM_elec.page.show();
                    lowerECAM_elec.update();
                } else {
                    lowerECAM_sts.page.show();                    
                    lowerECAM_sts.update();                    
                }
            }
        } else {
            me.hideAllPages();
        }
    },
    updateBottomStatus: func() {
        me["TAT"].setText(sprintf("%2.0f", getprop("/environment/temperature-degc")));
        me["SAT"].setText(sprintf("%2.0f", getprop("/environment/temperature-degc")));
        me["UTCh"].setText(sprintf("%02d", getprop("/sim/time/utc/hour")));
        me["UTCm"].setText(sprintf("%02d", getprop("/sim/time/utc/minute")));
        if (acconfig_weight_kgs.getValue() == 1) {
            me["GW-weight-unit"].setText("KG");
            me["GW"].setText(sprintf("%s", math.round(getprop("/FMGC/internal/gw") * LBS2KGS, 10)));             
        } else {
            me["GW"].setText(sprintf("%s", math.round(getprop("/FMGC/internal/gw"))));        
            me["GW-weight-unit"].setText("LBS");
        }
    },
    hideAllPages: func() {
        lowerECAM_test.page.hide();
        lowerECAM_apu.page.hide();
        lowerECAM_eng.page.hide();
        lowerECAM_fctl.page.hide();
        lowerECAM_sts.page.hide();    
        lowerECAM_elec.page.hide();    
    },
};

setlistener("sim/signals/fdm-initialized", func {
    lowerECAM_display = canvas.new({
        "name": "lowerECAM",
        "size": [1024, 1024],
        "view": [1024, 1024],
        "mipmapping": 1
    });
    lowerECAM_display.addPlacement({"node": "lecam.screen"});
    var groupApu = lowerECAM_display.createGroup();
    var groupEng = lowerECAM_display.createGroup();
    var groupFctl = lowerECAM_display.createGroup();
    var groupSts = lowerECAM_display.createGroup();
    var groupElec = lowerECAM_display.createGroup();
    var group_test = lowerECAM_display.createGroup();

    lowerECAM_apu = canvas_lowerECAM_apu.new(groupApu, "Aircraft/Airbus_A330/Models/Instruments/Lower-ECAM/res/apu.svg");
    lowerECAM_eng = canvas_lowerECAM_eng.new(groupEng, "Aircraft/Airbus_A330/Models/Instruments/Lower-ECAM/res/eng.svg");
    lowerECAM_fctl = canvas_lowerECAM_fctl.new(groupFctl, "Aircraft/Airbus_A330/Models/Instruments/Lower-ECAM/res/fctl.svg");
    lowerECAM_sts = canvas_lowerECAM_sts.new(groupSts, "Aircraft/Airbus_A330/Models/Instruments/Lower-ECAM/res/status.svg");
    lowerECAM_elec = canvas_lowerECAM_elec.new(groupElec, "Aircraft/Airbus_A330/Models/Instruments/Lower-ECAM/res/elec.svg");
    lowerECAM_test = canvas_lowerECAM_test.new(group_test, "Aircraft/Airbus_A330/Models/Instruments/Common/res/du-test.svg");
    
    lowerECAM_update.start();
    if (getprop("/systems/acconfig/options/lecam-rate") > 1) {
        l_rateApply();
    }
});

var l_rateApply = func {
    lowerECAM_update.restart(0.05 * getprop("/systems/acconfig/options/lecam-rate"));
}

var lowerECAM_update = maketimer(0.05, func {
    canvas_lowerECAM_base.update();
});

var showLowerECAM = func {
    var dlg = canvas.Window.new([512, 512], "dialog").set("resize", 1);
    dlg.setCanvas(lowerECAM_display);
}
