# Lower ECAM APU Page
# Based on A3XX Lower ECAM Canvas
# Copyright (c) 2020 Josh Davidson (Octal450)

# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_apu = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_apu, canvas_lowerECAM_base]};
        m.init("apu.svg");

        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","APUN-needle","APUEGT-needle","APUN","APUEGT","APUAvail","APUFlapOpen","APUBleedValve","APUBleedOnline","APUGenOnline","APUGentext","APUGenLoad","APUGenbox","APUGenVolt","APUGenHz","APUBleedPSI","APUfuelLO",
        "text3724","text3728","text3732", "GW-weight-unit"];
    },
    update: func() {
        oat = getprop("/environment/temperature-degc");

        # Avail and Flap Open
        if (getprop("/systems/apu/flap") == 1) {
            me["APUFlapOpen"].show();
        } else {
            me["APUFlapOpen"].hide();
        }

        if (getprop("/systems/apu/rpm") > 99.5) {
            me["APUAvail"].show();
        } else {
            me["APUAvail"].hide();
        }

        if (getprop("/fdm/jsbsim/propulsion/tank[2]/contents-lbs") < 100) {
            me["APUfuelLO"].show();
        } else {
            me["APUfuelLO"].hide();
        }

        # APU Gen
        if (getprop("/systems/electrical/extra/apu-volts") > 110) {
            me["APUGenVolt"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["APUGenVolt"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/electrical/extra/apu-hz") > 380) {
            me["APUGenHz"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["APUGenHz"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/controls/APU/master") == 1 or getprop("/systems/apu/rpm") >= 94.9) {
            me["APUGenbox"].show();
            me["APUGenHz"].show();
            me["APUGenVolt"].show();
            me["APUGenLoad"].show();
            me["text3724"].show();
            me["text3728"].show();
            me["text3732"].show();
        } else {
            me["APUGenbox"].hide();
            me["APUGenHz"].hide();
            me["APUGenVolt"].hide();
            me["APUGenLoad"].hide();
            me["text3724"].hide();
            me["text3728"].hide();
            me["text3732"].hide();
        }

        if ((getprop("/systems/apu/rpm") > 94.9) and (getprop("/controls/electrical/switches/gen-apu") == 1)) {
            me["APUGenOnline"].show();
        } else {
            me["APUGenOnline"].hide();
        }

        if ((getprop("/controls/APU/master") == 0) or ((getprop("/controls/APU/master") == 1) and (getprop("/controls/electrical/switches/gen-apu") == 1) and (getprop("/systems/apu/rpm") > 94.9))) {
            me["APUGentext"].setColor(0.8078,0.8039,0.8078);
        } else if ((getprop("/controls/APU/master") == 1) and (getprop("/controls/electrical/switches/gen-apu") == 0) and (getprop("/systems/apu/rpm") < 94.9)) {
            me["APUGentext"].setColor(0.7333,0.3803,0);
        }

        me["APUGenLoad"].setText(sprintf("%s", math.round(getprop("/systems/electrical/extra/apu-load"))));
        me["APUGenVolt"].setText(sprintf("%s", math.round(getprop("/systems/electrical/extra/apu-volts"))));
        me["APUGenHz"].setText(sprintf("%s", math.round(getprop("/systems/electrical/extra/apu-hz"))));

        # APU Bleed
        if (getprop("/controls/adirs/ir[1]/knob") != 0 and (getprop("/controls/APU/master") == 1 or getprop("/systems/pneumatic/bleedapu") > 0)) {
            me["APUBleedPSI"].setColor(0.0509,0.7529,0.2941);
            me["APUBleedPSI"].setText(sprintf("%s", math.round(getprop("/systems/pneumatic/bleedapu"))));
        } else {
            me["APUBleedPSI"].setColor(0.7333,0.3803,0);
            me["APUBleedPSI"].setText(sprintf("%s", "XX"));
        }

        if (getprop("/controls/pneumatic/switches/bleedapu") == 1) {
            me["APUBleedValve"].setRotation(90 * D2R);
            me["APUBleedOnline"].show();
        } else {
            me["APUBleedValve"].setRotation(0);
            me["APUBleedOnline"].hide();
        }

        # APU N and EGT
        if (getprop("/controls/APU/master") == 1) {
            me["APUN"].setColor(0.0509,0.7529,0.2941);
            me["APUN"].setText(sprintf("%s", math.round(getprop("/systems/apu/rpm"))));
            me["APUEGT"].setColor(0.0509,0.7529,0.2941);
            me["APUEGT"].setText(sprintf("%s", math.round(getprop("/systems/apu/egt"))));
        } else if (getprop("/systems/apu/rpm") >= 1) {
            me["APUN"].setColor(0.0509,0.7529,0.2941);
            me["APUN"].setText(sprintf("%s", math.round(getprop("/systems/apu/rpm"))));
            me["APUEGT"].setColor(0.0509,0.7529,0.2941);
            me["APUEGT"].setText(sprintf("%s", math.round(getprop("/systems/apu/egt"))));
        } else {
            me["APUN"].setColor(0.7333,0.3803,0);
            me["APUN"].setText(sprintf("%s", "XX"));
            me["APUEGT"].setColor(0.7333,0.3803,0);
            me["APUEGT"].setText(sprintf("%s", "XX"));
        }
        me["APUN-needle"].setRotation((getprop("/ECAM/Lower/APU-N") + 90) * D2R);
        me["APUEGT-needle"].setRotation((getprop("/ECAM/Lower/APU-EGT") + 90) * D2R);

        me.updateBottomStatus();
    },
};
