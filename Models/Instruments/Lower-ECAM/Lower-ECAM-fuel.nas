# Lower ECAM Fuel Page
#
# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_fuel = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_fuel, canvas_lowerECAM_base]};
        m.init("fuel.svg");
        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","GW-weight-unit",
            "FUEL-Center-blocked","FUEL-Center-Inacc",
            "FUEL-Left-Inner-Inacc","FUEL-Right-Inner-Inacc",
            "FUEL-used-1","FUEL-used-2","FUEL-used-both",
            "Fused-weight-unit","FUEL-On-Board","FOB-weight-unit",
            "FUEL-Left-Inner-quantity","FUEL-Right-Inner-quantity",
            "FUEL-Center-quantity",
            "FUEL-Left-Inner-temp","FUEL-Right-Inner-temp",
            "FUEL-XFEED-Left","FUEL-XFEED-Right",
            "FUEL-XFEED-On","FUEL-XFEED-Off",
            "FUEL-ENG-1-On","FUEL-ENG-1-Off",
            "FUEL-ENG-2-On","FUEL-ENG-2-Off",
            "FUEL-Pump-Left-1-1","FUEL-Pump-Left-1-2",
            "FUEL-Pump-Left-1-3","FUEL-Pump-Left-1-4",
            "FUEL-Pump-Left-2-1","FUEL-Pump-Left-2-2",
            "FUEL-Pump-Left-2-3","FUEL-Pump-Left-2-4",
            "FUEL-Pump-Center-1-1","FUEL-Pump-Center-1-2",
            "FUEL-Pump-Center-1-3","FUEL-Pump-Center-1-4",
            "FUEL-Pump-Center-2-1","FUEL-Pump-Center-2-2",
            "FUEL-Pump-Center-2-3","FUEL-Pump-Center-2-4",
            "FUEL-Pump-Right-1-1","FUEL-Pump-Right-1-2",
            "FUEL-Pump-Right-1-3","FUEL-Pump-Right-1-4",
            "FUEL-Pump-Right-2-1","FUEL-Pump-Right-2-2",
            "FUEL-Pump-Right-2-3","FUEL-Pump-Right-2-4",
            "FUEL-Pump-Left-1-Open","FUEL-Pump-Left-1-Closed",
            "FUEL-Pump-Left-2-Open","FUEL-Pump-Left-2-Closed",
            "FUEL-Pump-Left-3-Open","FUEL-Pump-Left-3-Closed",
            "FUEL-Pump-Center-1-Open","FUEL-Pump-Center-1-Closed",
            "FUEL-Pump-Center-2-Open","FUEL-Pump-Center-2-Closed",
            "FUEL-Pump-Right-1-Open","FUEL-Pump-Right-1-Closed",
            "FUEL-Pump-Right-2-Open","FUEL-Pump-Right-2-Closed",
            "FUEL-Pump-Right-3-Open","FUEL-Pump-Right-3-Closed",
            "FUEL-APU-label","FUEL-APU-arrow","FUEL-APU-line",
            "FUEL-Pipes-Center","FUEL-Pipe-Center1","FUEL-Pipe-Center2",
            "FUEL-ENG-1-label","FUEL-ENG-2-label",
            "GLoad",
        ];
    },
    monitor_hash: {},
    initPage: func() {
        # Currently unused things
        me["FUEL-Center-blocked"].hide();
        me["FUEL-Center-Inacc"].hide();
        me["FUEL-Left-Inner-Inacc"].hide();
        me["FUEL-Right-Inner-Inacc"].hide();
        me["FUEL-used-1"].hide();
        me["FUEL-used-2"].hide();
        me["FUEL-used-both"].hide();
        me["Fused-weight-unit"].hide();
        me["FUEL-APU-label"].hide();
        me["FUEL-APU-arrow"].hide();
        me["FUEL-APU-line"].hide();
        me["GLoad"].hide();

        # Monitor things that seldom change
        me.monitor_hash["pump-L1-fault"] =
            lowerECAM_prop_monitor.new("/systems/fuel/tank0pump1-fault");
        me.monitor_hash["pump-L2-fault"] =
            lowerECAM_prop_monitor.new("/systems/fuel/tank0pump2-fault");
        me.monitor_hash["pump-C1-fault"] =
            lowerECAM_prop_monitor.new("/systems/fuel/tank1pump1-fault");
        me.monitor_hash["pump-C2-fault"] =
            lowerECAM_prop_monitor.new("/systems/fuel/tank1pump2-fault");
        me.monitor_hash["pump-R1-fault"] =
            lowerECAM_prop_monitor.new("/systems/fuel/tank2pump1-fault");
        me.monitor_hash["pump-R2-fault"] =
            lowerECAM_prop_monitor.new("/systems/fuel/tank2pump2-fault");
        me.monitor_hash["x-feed"] =
            lowerECAM_prop_monitor.new("/systems/fuel/x-feed");
        me.monitor_hash["engine-1-cutoff"] =
            lowerECAM_prop_monitor.new("/controls/engines/engine[0]/cutoff");
        me.monitor_hash["engine-2-cutoff"] =
            lowerECAM_prop_monitor.new("/controls/engines/engine[1]/cutoff");
        me.monitor_hash["engine-1-running"] =
            lowerECAM_prop_monitor.new("/engines/engine[0]/running");
        me.monitor_hash["engine-2-running"] =
            lowerECAM_prop_monitor.new("/engines/engine[1]/running");
    },
    update: func() {
        # Monitor things that seldom change
        foreach(var key; keys(me.monitor_hash)) {
            me.monitor_hash[key].update();
        }

        # Quantities
        # Real display has inner/outer tanks, collector cells, and trim tanks,
        # but these things are not currently implemented by the model.
        if (me.weight_kgs_used) {
            me["FOB-weight-unit"].setText("KG");
            me["FUEL-On-Board"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/total-fuel-kg"), 10)));
            me["FUEL-Left-Inner-quantity"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/tank[0]/level-kg"),
                10)));
            me["FUEL-Center-quantity"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/tank[1]/level-kg"),
                10)));
            me["FUEL-Right-Inner-quantity"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/tank[2]/level-kg"),
                10)));
        } else {
            me["FOB-weight-unit"].setText("LBS");
            me["FUEL-On-Board"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/total-fuel-lbs"), 10)));
            me["FUEL-Left-Inner-quantity"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/tank[0]/level-lbs"),
                10)));
            me["FUEL-Center-quantity"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/tank[1]/level-lbs"),
                10)));
            me["FUEL-Right-Inner-quantity"].setText(sprintf("%s",
                math.round(getprop("/consumables/fuel/tank[2]/level-lbs"),
                10)));
        }

        # Temperature
        # Left tank value is shown after the unit label which looks a bit odd,
        # but the layout is for inner/outer tanks which are not currently
        # implemented by the model.
        me["FUEL-Left-Inner-temp"].setText(sprintf("%s",
            math.round(getprop("/consumables/fuel/tank[0]/temperature_degC"))));
        me["FUEL-Right-Inner-temp"].setText(sprintf("%s",
            math.round(getprop("/consumables/fuel/tank[2]/temperature_degC"))));

        # Valves
        if (me.monitor_hash["x-feed"].test()) {
            if (me.monitor_hash["x-feed"].value) {
                me["FUEL-XFEED-On"].show();
                me["FUEL-XFEED-Off"].hide();
                me["FUEL-XFEED-Left"].show();
                me["FUEL-XFEED-Right"].show();
            } else {
                me["FUEL-XFEED-On"].hide();
                me["FUEL-XFEED-Off"].show();
                me["FUEL-XFEED-Left"].hide();
                me["FUEL-XFEED-Right"].hide();
            }
        }
        if (me.monitor_hash["engine-1-cutoff"].test()) {
            if (me.monitor_hash["engine-1-cutoff"].value) {
                me["FUEL-ENG-1-Off"].show();
                me["FUEL-ENG-1-On"].hide();
            } else {
                me["FUEL-ENG-1-Off"].hide();
                me["FUEL-ENG-1-On"].show();
            }
        }
        if (me.monitor_hash["engine-2-cutoff"].test()) {
            if (me.monitor_hash["engine-2-cutoff"].value) {
                me["FUEL-ENG-2-Off"].show();
                me["FUEL-ENG-2-On"].hide();
            } else {
                me["FUEL-ENG-2-Off"].hide();
                me["FUEL-ENG-2-On"].show();
            }
        }
        if (me.monitor_hash["engine-1-running"].test()) {
            if (me.monitor_hash["engine-1-running"].value) {
                me["FUEL-ENG-1-label"].setColor(0.8078,0.8039,0.8078);
            } else {
                me["FUEL-ENG-1-label"].setColor(0.7333,0.3803,0);
            }
        }
        if (me.monitor_hash["engine-2-running"].test()) {
            if (me.monitor_hash["engine-2-running"].value) {
                me["FUEL-ENG-2-label"].setColor(0.8078,0.8039,0.8078);
            } else {
                me["FUEL-ENG-2-label"].setColor(0.7333,0.3803,0);
            }
        }

        # Wing Pumps
        # Pump 3 in each wing is a standby pump which is only active if switched
        # on and at least one of the main pumps in that wing is off or faulted.
        var left_pump1_switch = getprop("/controls/fuel/tank0pump1");
        var left_pump2_switch = getprop("/controls/fuel/tank0pump2");
        var left_pump3_switch = getprop("/controls/fuel/tank0pump3");
        var right_pump1_switch = getprop("/controls/fuel/tank2pump1");
        var right_pump2_switch = getprop("/controls/fuel/tank2pump2");
        var right_pump3_switch = getprop("/controls/fuel/tank2pump3");
        var left_pump1_fault = me.monitor_hash["pump-L1-fault"].value;
        var left_pump2_fault = me.monitor_hash["pump-L2-fault"].value;
        var right_pump1_fault = me.monitor_hash["pump-R1-fault"].value;
        var right_pump2_fault = me.monitor_hash["pump-R2-fault"].value;
        if (left_pump1_switch == 1) {
            me["FUEL-Pump-Left-1-Open"].show();
            me["FUEL-Pump-Left-1-Closed"].hide();
        } else {
            me["FUEL-Pump-Left-1-Open"].hide();
            me["FUEL-Pump-Left-1-Closed"].show();
        }
        if (me.monitor_hash["pump-L1-fault"].test()) {
            if (left_pump1_fault == 1) {
                me["FUEL-Pump-Left-1-1"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-1-2"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-1-3"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-1-4"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-1-Open"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-1-Closed"].setColorFill(0.7333,0.3803,0);
            } else {
                me["FUEL-Pump-Left-1-1"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-1-2"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-1-3"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-1-4"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-1-Open"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-1-Closed"].setColorFill(0.0509,0.7529,0.2941);
            }
        }
        if (left_pump2_switch == 1) {
            me["FUEL-Pump-Left-2-Open"].show();
            me["FUEL-Pump-Left-2-Closed"].hide();
        } else {
            me["FUEL-Pump-Left-2-Open"].hide();
            me["FUEL-Pump-Left-2-Closed"].show();
        }
        if (me.monitor_hash["pump-L2-fault"].test()) {
            if (left_pump2_fault == 1) {
                me["FUEL-Pump-Left-2-1"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-2-2"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-2-3"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-2-4"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-2-Open"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Left-2-Closed"].setColorFill(0.7333,0.3803,0);
            } else {
                me["FUEL-Pump-Left-2-1"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-2-2"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-2-3"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-2-4"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-2-Open"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Left-2-Closed"].setColorFill(0.0509,0.7529,0.2941);
            }
        }
        if (left_pump3_switch == 1 and
                (left_pump1_switch != 1 or left_pump2_switch != 1 or
                 left_pump1_fault == 1 or left_pump2_fault == 1)) {
            me["FUEL-Pump-Left-3-Open"].show();
            me["FUEL-Pump-Left-3-Closed"].hide();
        } else {
            me["FUEL-Pump-Left-3-Open"].hide();
            me["FUEL-Pump-Left-3-Closed"].show();
        }
        if (right_pump1_switch == 1) {
            me["FUEL-Pump-Right-1-Open"].show();
            me["FUEL-Pump-Right-1-Closed"].hide();
        } else {
            me["FUEL-Pump-Right-1-Open"].hide();
            me["FUEL-Pump-Right-1-Closed"].show();
        }
        if (me.monitor_hash["pump-R1-fault"].test()) {
            if (right_pump1_fault == 1) {
                me["FUEL-Pump-Right-1-1"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-1-2"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-1-3"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-1-4"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-1-Open"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-1-Closed"].setColorFill(0.7333,0.3803,0);
            } else {
                me["FUEL-Pump-Right-1-1"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-1-2"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-1-3"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-1-4"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-1-Open"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-1-Closed"].setColorFill(0.0509,0.7529,0.2941);
            }
        }
        if (right_pump2_switch == 1) {
            me["FUEL-Pump-Right-2-Open"].show();
            me["FUEL-Pump-Right-2-Closed"].hide();
        } else {
            me["FUEL-Pump-Right-2-Open"].hide();
            me["FUEL-Pump-Right-2-Closed"].show();
        }
        if (me.monitor_hash["pump-R2-fault"].test()) {
            if (right_pump2_fault == 1) {
                me["FUEL-Pump-Right-2-1"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-2-2"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-2-3"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-2-4"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-2-Open"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Right-2-Closed"].setColorFill(0.7333,0.3803,0);
            } else {
                me["FUEL-Pump-Right-2-1"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-2-2"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-2-3"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-2-4"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-2-Open"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Right-2-Closed"].setColorFill(0.0509,0.7529,0.2941);
            }
        }
        if (right_pump3_switch == 1 and
                (right_pump1_switch != 1 or right_pump2_switch != 1 or
                 right_pump1_fault == 1 or right_pump2_fault == 1)) {
            me["FUEL-Pump-Right-3-Open"].show();
            me["FUEL-Pump-Right-3-Closed"].hide();
        } else {
            me["FUEL-Pump-Right-3-Open"].hide();
            me["FUEL-Pump-Right-3-Closed"].show();
        }

        # Center Tank Pumps
        # Pumps move fuel from center tank into wing tanks so to be active they
        # must be switched on and have fuel available to move.
        # Note that the center tank does not seem to be currently implemented
        # correctly by the model.
        var center_fuel = getprop("/consumables/fuel/tank[1]/level-kg");
        var center_pump1_switch = getprop("/controls/fuel/tank1pump1");
        var center_pump2_switch = getprop("/controls/fuel/tank1pump2");
        var center_used = (center_fuel > 1) and (center_pump1_switch or
            center_pump2_switch);
        if (center_used) {
            me["FUEL-Pipes-Center"].show();
            if (center_pump1_switch) {
                me["FUEL-Pump-Center-1-Open"].show();
                me["FUEL-Pump-Center-1-Closed"].hide();
                me["FUEL-Pipe-Center1"].show();
            } else {
                me["FUEL-Pump-Center-1-Open"].hide();
                me["FUEL-Pump-Center-1-Closed"].show();
                me["FUEL-Pipe-Center1"].hide();
            }
            if (center_pump2_switch) {
                me["FUEL-Pump-Center-2-Open"].show();
                me["FUEL-Pump-Center-2-Closed"].hide();
                me["FUEL-Pipe-Center2"].show();
            } else {
                me["FUEL-Pump-Center-2-Open"].hide();
                me["FUEL-Pump-Center-2-Closed"].show();
                me["FUEL-Pipe-Center2"].hide();
            }
        } else {
            me["FUEL-Pipes-Center"].hide();
            me["FUEL-Pipe-Center1"].hide();
            me["FUEL-Pipe-Center2"].hide();
            me["FUEL-Pump-Center-1-Open"].hide();
            me["FUEL-Pump-Center-1-Closed"].show();
            me["FUEL-Pump-Center-2-Open"].hide();
            me["FUEL-Pump-Center-2-Closed"].show();
        }
        if (me.monitor_hash["pump-C1-fault"].test()) {
            if (me.monitor_hash["pump-C1-fault"].value == 1) {
                me["FUEL-Pump-Center-1-1"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-1-2"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-1-3"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-1-4"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-1-Open"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-1-Closed"].setColorFill(0.7333,0.3803,0);
            } else {
                me["FUEL-Pump-Center-1-1"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-1-2"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-1-3"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-1-4"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-1-Open"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-1-Closed"].setColorFill(0.0509,0.7529,0.2941);
            }
        }
        if (me.monitor_hash["pump-C2-fault"].test()) {
            if (me.monitor_hash["pump-C2-fault"].value == 1) {
                me["FUEL-Pump-Center-2-1"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-2-2"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-2-3"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-2-4"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-2-Open"].setColorFill(0.7333,0.3803,0);
                me["FUEL-Pump-Center-2-Closed"].setColorFill(0.7333,0.3803,0);
            } else {
                me["FUEL-Pump-Center-2-1"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-2-2"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-2-3"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-2-4"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-2-Open"].setColorFill(0.0509,0.7529,0.2941);
                me["FUEL-Pump-Center-2-Closed"].setColorFill(0.0509,0.7529,0.2941);
            }
        }

        # Bottom section
        me.updateBottomStatus();
    },
};
