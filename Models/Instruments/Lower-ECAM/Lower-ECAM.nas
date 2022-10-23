# A3XX Lower ECAM Canvas

# Copyright (c) 2020 Josh Davidson (Octal450)

# Initialize properties
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

# Base class for pages other than self test
var canvas_lowerECAM_base = {
    # Shared variables
    weight_kgs_used: 1,

    # Methods
    init: func(file) {
        var font_mapper = func(family, weight) {
            return "LiberationFonts/LiberationSans-Regular.ttf";
        };
        var canvas_group = lowerECAM_controller.createGroup();
        canvas.parsesvg(canvas_group, "Aircraft/Airbus_A330/Models/Instruments/Lower-ECAM/res/" ~ file, {"font-mapper": font_mapper});

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
    initPage: func() {
    },
    updateBottomStatus: func() {
        me["TAT"].setText(sprintf("%2.0f", getprop("/environment/temperature-degc")));
        me["SAT"].setText(sprintf("%2.0f", getprop("/environment/temperature-degc")));
        me["UTCh"].setText(sprintf("%02d", getprop("/sim/time/utc/hour")));
        me["UTCm"].setText(sprintf("%02d", getprop("/sim/time/utc/minute")));
        if (me.weight_kgs_used) {
            # LB2KG is a FlightGear global constant
            me["GW-weight-unit"].setText("KG");
            me["GW"].setText(sprintf("%s", math.round(getprop("/FMGC/internal/gw") * LB2KG, 10)));
        } else {
            me["GW"].setText(sprintf("%s", math.round(getprop("/FMGC/internal/gw"))));
            me["GW-weight-unit"].setText("LBS");
        }
    },
};

# Self test page
var canvas_lowerECAM_test = {
    init: func(file) {
        var font_mapper = func(family, weight) {
            return "LiberationFonts/LiberationSans-Regular.ttf";
        };
        var canvas_group = lowerECAM_controller.createGroup();
        canvas.parsesvg(canvas_group, file, {"font-mapper": font_mapper});

        var svg_keys = me.getKeys();
        foreach(var key; svg_keys) {
            me[key] = canvas_group.getElementById(key);
        }
        me.page = canvas_group;
        return me;
    },
    new: func() {
        var m = {parents: [canvas_lowerECAM_test]};
        m.init("Aircraft/Airbus_A330/Models/Instruments/Common/res/du-test.svg");
        return m;
    },
    getKeys: func() {
        return ["Test_white","Test_text"];
    },
    update: func() {
        var elapsed_time = getprop("/sim/time/elapsed-sec");
        if (getprop("/instrumentation/du/du4-test-time") + 1 >= elapsed_time) {
            me["Test_white"].show();
            me["Test_text"].hide();
        } else {
            me["Test_white"].hide();
            me["Test_text"].show();
        }
    },
};

# Simple class for monitoring generic items for changes
var lowerECAM_gen_monitor = {
    new: func() {
        var m = {
            parents: [me],
            value: 0,
            flag: 1, # Make sure the first test is true
        };
        return m;
    },
    update: func(new_value) {
        # Compares and may set the value and flag but never clears the flag
        if (new_value != me.value) {
            me.value = new_value;
            me.flag = 1;
        }
    },
    test: func() {
        # Returns the flag value AND clears it. If you just need to check the
        # flag use the flag member variable directly.
        var flag_was = me.flag;
        me.flag = 0;
        return flag_was;
    },
};

# Simple class for monitoring properties for changes
var lowerECAM_prop_monitor = {
    new: func(property) {
        var m = {
            parents: [me],
            prop_name: property,
            value: 0,
            flag: 1, # Make sure the first test is true
        };
        return m;
    },
    update: func() {
        # Compares and may set the value and flag but never clears the flag
        var t = getprop(me.prop_name);
        if (t != me.value) {
            me.value = t;
            me.flag = 1;
        }
    },
    test: func() {
        # Returns the flag value AND clears it. If you just need to check the
        # flag use the flag member variable directly.
        var flag_was = me.flag;
        me.flag = 0;
        return flag_was;
    },
};

# Controller for updating display
var lowerECAM_controller = {
    # Shared variables
    display: nil,
    test_page: nil,
    page_hash: {},
    previous_page_name: "",

    # Methods
    init: func() {
        me.display = canvas.new({
            "name": "lowerECAM",
            "size": [1024, 1024],
            "view": [1024, 1024],
            "mipmapping": 1
        });
        me.display.addPlacement({"node": "lecam.screen"});
        me.test_page = canvas_lowerECAM_test.new();

        # Map property name to page object
        var apu_obj = canvas_lowerECAM_apu.new();
        var eng_obj = canvas_lowerECAM_eng.new();
        var fctl_obj = canvas_lowerECAM_fctl.new();
        var sts_obj = canvas_lowerECAM_sts.new();
        var elec_obj = canvas_lowerECAM_elec.new();
        var hyd_obj = canvas_lowerECAM_hyd.new();
        var wheel_obj = canvas_lowerECAM_wheel.new();
        var fuel_obj = canvas_lowerECAM_fuel.new();
        me.page_hash = {
            "apu" : apu_obj,
            "eng" : eng_obj,
            "fctl" : fctl_obj,
            "sts" : sts_obj,
            "elec" : elec_obj,
            "hyd" : hyd_obj,
            "wheel" : wheel_obj,
            "fuel" : fuel_obj,
        };

        # Initialization for pages to hide never used labels etc.
        foreach(var key; keys(me.page_hash)) {
            me.page_hash[key].initPage();
        }

        lowerECAM_update.start();
        if (getprop("/systems/acconfig/options/lecam-rate") > 1) {
            l_rateApply();
        }
    },
    hideAllPages: func() {
        me.test_page.page.hide();
        foreach(var key; keys(me.page_hash)) {
            me.page_hash[key].page.hide();
        }
    },
    debug_total: 0, # DEBUG ONLY
    debug_count: 0, # DEBUG ONLY
    update: func() {
        var timestamp = maketimestamp(); # DEBUG ONLY
        canvas_lowerECAM_base.weight_kgs_used =
            getprop("/systems/acconfig/options/weight-kgs");
        var elapsed_time = getprop("/sim/time/elapsed-sec");
        if (getprop("/systems/electrical/bus/ac2") >= 110) {
            if (getprop("/gear/gear[0]/wow") == 1) {
                if (getprop("/systems/acconfig/autoconfig-running") != 1 and getprop("/instrumentation/du/du4-test") != 1) {
                    setprop("/instrumentation/du/du4-test", 1);
                    setprop("/instrumentation/du/du4-test-amount",
                        math.round((rand() * 5 ) + 35, 0.1));
                    setprop("/instrumentation/du/du4-test-time", elapsed_time);
                } else if (getprop("/systems/acconfig/autoconfig-running") == 1 and getprop("/instrumentation/du/du4-test") != 1) {
                    setprop("/instrumentation/du/du4-test", 1);
                    setprop("/instrumentation/du/du4-test-amount", math.round((rand() * 5 ) + 35, 0.1));
                    setprop("/instrumentation/du/du4-test-time",
                        elapsed_time - 30);
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
            if (getprop("/instrumentation/du/du4-test-time") + getprop("/instrumentation/du/du4-test-amount") >= elapsed_time) {
                lowerECAM_controller.hideAllPages();
                me.test_page.page.show();
                me.test_page.update();
            } else {
                me.test_page.page.hide();
                var page_name = getprop("/ECAM/Lower/page");
                if (page_name != me.previous_page_name) {
                    var lookup = me.page_hash[me.previous_page_name];
                    if (lookup != nil) {
                        lookup.page.hide();
                    } else {
                        # Default to status page for unsupported page names
                        me.page_hash["sts"].page.hide();
                    }
                    me.previous_page_name = page_name;
                }
                var lookup = me.page_hash[page_name];
                if (lookup != nil) {
                    lookup.page.show();
                    lookup.update();
                } else {
                    # Default to status page for unsupported page names
                    me.page_hash["sts"].page.show();
                    me.page_hash["sts"].update();
                }

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
            }
        } else {
            lowerECAM_controller.hideAllPages();
        }
    },
    showECAM: func() {
        var dlg = canvas.Window.new([512, 512], "dialog").set("resize", 1);
        dlg.setCanvas(me.display);
    },
    createGroup: func() {
        return me.display.createGroup();
    },
};

setlistener("sim/signals/fdm-initialized", func {
    lowerECAM_controller.init();
});

# Default update rate is 50 ms but can be slowed down via the "DU Quality" dialog
var lowerECAM_update = maketimer(0.05, func {
    lowerECAM_controller.update();
});

# Called by AircraftConfig/du-quality.xml
var l_rateApply = func {
    lowerECAM_update.restart(0.05 * getprop("/systems/acconfig/options/lecam-rate"));
}

# Called by Lower-ECAM.xml
var showLowerECAM = func {
    lowerECAM_controller.showECAM();
}
