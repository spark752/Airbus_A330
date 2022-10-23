# Lower ECAM Wheel Page
#
# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_wheel = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_wheel, canvas_lowerECAM_base]};
        m.init("wheel.svg");
        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","GW-weight-unit",
            "noseuplock","leftuplock","rightuplock","lgctltext","NWStext",
            "NORMbrk","antiskidtext","autobrk","autobrkind","Brakes-Released",
            "Triangle-Nose1-Green","Triangle-Nose2-Green",
            "Triangle-Nose1-Red","Triangle-Nose2-Red",
            "Triangle-Left1-Green","Triangle-Left2-Green",
            "Triangle-Left1-Red","Triangle-Left2-Red",
            "Triangle-Right1-Green","Triangle-Right2-Green",
            "Triangle-Right1-Red","Triangle-Right2-Red",
            "Tire-Pressures","Spoilers",
            "braketemp1","braketemp2","braketemp3","braketemp4",
            "braketemp5","braketemp6","braketemp7","braketemp8",
            "GLoad",
        ];
    },
    overheat_status: [],
    initPage: func() {
        # Currently unused things
        me["Spoilers"].hide();
        me["noseuplock"].hide();
        me["leftuplock"].hide();
        me["rightuplock"].hide();
        me["lgctltext"].hide();
        me["Tire-Pressures"].hide();
        me["GLoad"].hide();

        # Monitor overheat status
        for (var i = 0; i < 4; i += 1) {
            append(me.overheat_status, lowerECAM_gen_monitor.new());
        }
    },
    update: func() {
        # Nose wheel steering
        var nws_switch = getprop("/controls/gear/nws-switch");
        if (nws_switch) {
            me["NWStext"].hide();
            me["NORMbrk"].hide();
            me["antiskidtext"].hide();
        } else {
            me["NWStext"].show();
            me["NORMbrk"].show();
            me["antiskidtext"].show();
        }

        # Autobrake
        var autobrake_mode = getprop("/controls/autobrake/mode");
        if (autobrake_mode > 0) {
            me["autobrk"].show();
            me["autobrkind"].show();
            if (autobrake_mode == 1) {
                me["autobrkind"].setText("LO");
            } else if (autobrake_mode == 2) {
                me["autobrkind"].setText("MED");
            } else {
                me["autobrkind"].setText("MAX");
            }
        } else {
            me["autobrk"].hide();
            me["autobrkind"].hide();
        }

        # Landing gear position
        var lg_nose = getprop("/gear/gear[0]/position-norm");
        var lg_left = getprop("/gear/gear[1]/position-norm");
        var lg_right = getprop("/gear/gear[2]/position-norm");
        if (lg_nose > 0.99) {
            me["Triangle-Nose1-Green"].show();
            me["Triangle-Nose2-Green"].show();
            me["Triangle-Nose1-Red"].hide();
            me["Triangle-Nose2-Red"].hide();
        } else if (lg_nose < 0.1) {
            me["Triangle-Nose1-Green"].hide();
            me["Triangle-Nose2-Green"].hide();
            me["Triangle-Nose1-Red"].hide();
            me["Triangle-Nose2-Red"].hide();
        } else {
            me["Triangle-Nose1-Green"].hide();
            me["Triangle-Nose2-Green"].hide();
            me["Triangle-Nose1-Red"].show();
            me["Triangle-Nose2-Red"].show();
        }
        if (lg_left > 0.99) {
            me["Triangle-Left1-Green"].show();
            me["Triangle-Left2-Green"].show();
            me["Triangle-Left1-Red"].hide();
            me["Triangle-Left2-Red"].hide();
        } else if (lg_left < 0.1) {
            me["Triangle-Left1-Green"].hide();
            me["Triangle-Left2-Green"].hide();
            me["Triangle-Left1-Red"].hide();
            me["Triangle-Left2-Red"].hide();
        } else {
            me["Triangle-Left1-Green"].hide();
            me["Triangle-Left2-Green"].hide();
            me["Triangle-Left1-Red"].show();
            me["Triangle-Left2-Red"].show();
        }
        if (lg_right > 0.99) {
            me["Triangle-Right1-Green"].show();
            me["Triangle-Right2-Green"].show();
            me["Triangle-Right1-Red"].hide();
            me["Triangle-Right2-Red"].hide();
        } else if (lg_right < 0.1) {
            me["Triangle-Right1-Green"].hide();
            me["Triangle-Right2-Green"].hide();
            me["Triangle-Right1-Red"].hide();
            me["Triangle-Right2-Red"].hide();
        } else {
            me["Triangle-Right1-Green"].hide();
            me["Triangle-Right2-Green"].hide();
            me["Triangle-Right1-Red"].show();
            me["Triangle-Right2-Red"].show();
        }

        # Brakes released
        var brakes_released = nws_switch and (lg_nose > 0.99) and
            (getprop("/controls/gear/brake-parking") < 0.1) and
            (getprop("/controls/gear/brake-left") < 0.05) and
            (getprop("/controls/gear/brake-right") < 0.05);
        if (brakes_released) {
            me["Brakes-Released"].show();
        } else {
            me["Brakes-Released"].hide();
        }

        # Brake temperatures
        # The A330 has brakes on eight wheels, but only four are supported by
        # the model (like an A320)
        var temperature = [
            math.round(getprop("/gear/gear[1]/L1brake-temp-degc"), 5),
            math.round(getprop("/gear/gear[1]/L2brake-temp-degc"), 5),
            math.round(getprop("/gear/gear[2]/R3brake-temp-degc"), 5),
            math.round(getprop("/gear/gear[2]/R4brake-temp-degc"), 5)
        ];
        forindex(var i; me.overheat_status) {
            me.overheat_status[i].update(temperature[i] > 300);
        }
        me["braketemp1"].setText(sprintf("%s", temperature[0]));
        me["braketemp5"].setText(sprintf("%s", temperature[0]));
        me["braketemp2"].setText(sprintf("%s", temperature[1]));
        me["braketemp6"].setText(sprintf("%s", temperature[1]));
        me["braketemp3"].setText(sprintf("%s", temperature[2]));
        me["braketemp7"].setText(sprintf("%s", temperature[2]));
        me["braketemp4"].setText(sprintf("%s", temperature[3]));
        me["braketemp8"].setText(sprintf("%s", temperature[3]));
        if (me.overheat_status[0].test()) {
            if (me.overheat_status[0].value) {
                me["braketemp1"].setColor(0.7333,0.3803,0);
                me["braketemp5"].setColor(0.7333,0.3803,0);
            } else {
                me["braketemp1"].setColor(0.0509,0.7529,0.2941);
                me["braketemp5"].setColor(0.0509,0.7529,0.2941);
            }
        }
        if (me.overheat_status[1].test()) {
            if (me.overheat_status[1].value) {
                me["braketemp2"].setColor(0.7333,0.3803,0);
                me["braketemp6"].setColor(0.7333,0.3803,0);
            } else {
                me["braketemp2"].setColor(0.0509,0.7529,0.2941);
                me["braketemp6"].setColor(0.0509,0.7529,0.2941);
            }
        }
        if (me.overheat_status[2].test()) {
            if (me.overheat_status[2].value) {
                me["braketemp3"].setColor(0.7333,0.3803,0);
                me["braketemp7"].setColor(0.7333,0.3803,0);
            } else {
                me["braketemp3"].setColor(0.0509,0.7529,0.2941);
                me["braketemp7"].setColor(0.0509,0.7529,0.2941);
            }
        }
        if (me.overheat_status[3].test()) {
            if (me.overheat_status[3].value) {
                me["braketemp4"].setColor(0.7333,0.3803,0);
                me["braketemp8"].setColor(0.7333,0.3803,0);
            } else {
                me["braketemp4"].setColor(0.0509,0.7529,0.2941);
                me["braketemp8"].setColor(0.0509,0.7529,0.2941);
            }
        }

        # Bottom section
        me.updateBottomStatus();
    },
};
