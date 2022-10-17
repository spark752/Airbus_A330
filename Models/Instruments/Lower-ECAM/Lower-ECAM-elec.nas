# Lower ECAM Electrical Page
#
# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_elec = {
    new: func(canvas_group, file) {
        var m = {parents: [canvas_lowerECAM_elec, canvas_lowerECAM_base]};
        m.init(canvas_group, file);
        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","GW-weight-unit",
        "IDG1-LOPR","IDG1-DISC","IDG2-LOPR","IDG2-DISC","IDG2-RISE-label",
        "IDG2-RISE-Value","IDG1-RISE-label","IDG1-RISE-Value",
        "Shed-label","GalleyShed","GLoad","ACESS-SHED",
        "BAT1-content","BAT1-OFF","BAT2-content","BAT2-OFF",
        "Bat1Volt","Bat1Ampere","Bat2Volt","Bat2Ampere",
        "BAT1-charge","BAT1-discharge","BAT2-charge","BAT2-discharge",
        "Emergen-Label","EmergenVolt","text3899","EmergenHz","text3907",
        "text4867","StatVolt","StatHz","text4875","text4883",
        "ExtVolt","ExtHz","text3728-6-7-2","text3732-2-4-6",
        "APU-content", "APUGEN-off",
        "GEN1-content", "GEN1-off",
        "GEN2-content", "GEN2-off"];
    },
    update: func() {
        # Battery 1
        me["BAT1-charge"].hide();
        me["BAT1-discharge"].show();
        if (getprop("/controls/electrical/switches/battery1") == 1) {
            me["BAT1-OFF"].hide();
            me["BAT1-content"].show();
            me["Bat1Volt"].setText(sprintf("%2.0f", getprop("/systems/electrical/battery1-volts")));
            me["Bat1Ampere"].setText(sprintf("%2.0f", getprop("/systems/electrical/battery1-amps")));
        } else {
            me["BAT1-OFF"].show();
            me["BAT1-content"].hide();
        }

        # Battery 2
        me["BAT2-charge"].hide();
        me["BAT2-discharge"].show();
        if (getprop("/controls/electrical/switches/battery2") == 1) {
            me["BAT2-OFF"].hide();
            me["BAT2-content"].show();
            me["Bat2Volt"].setText(sprintf("%2.0f", getprop("/systems/electrical/battery2-volts")));
            me["Bat2Ampere"].setText(sprintf("%2.0f", getprop("/systems/electrical/battery2-amps")));
        } else {
            me["BAT2-OFF"].show();
            me["BAT2-content"].hide();
        }

        # Emergency Generator
        me["Emergen-Label"].hide();
        me["EmergenVolt"].hide();
        me["text3899"].hide();
        me["EmergenHz"].hide();
        me["text3907"].hide();

        # External Power
        me["text4867"].hide();
        me["StatVolt"].hide();
        me["StatHz"].hide();
        me["text4875"].hide();
        me["text4883"].hide();
        if (getprop("/systems/electrical/gen-ext") == 1) {
            me["ExtVolt"].show();
            me["ExtHz"].show();
            me["text3728-6-7-2"].show();
            me["text3732-2-4-6"].show();
        } else {
            me["ExtVolt"].hide();
            me["ExtHz"].hide();
            me["text3728-6-7-2"].hide();
            me["text3732-2-4-6"].hide();
        }

        # APU
        if (getprop("/systems/electrical/gen-apu") == 1) {
            me["APUGEN-off"].hide();
            me["APU-content"].show();
        } else {
            me["APUGEN-off"].show();
            me["APU-content"].hide();
        }

        # Generator 1
        if (getprop("/engines/engine[0]/running")) {
            me["GEN1-off"].hide();
            me["GEN1-content"].show();
        } else {
            me["GEN1-off"].show();
            me["GEN1-content"].hide();
        }

        # Generator 2
        if (getprop("/engines/engine[1]/running")) {
            me["GEN2-off"].hide();
            me["GEN2-content"].show();
        } else {
            me["GEN2-off"].show();
            me["GEN2-content"].hide();
        }

        # Miscellaneous
        me["IDG1-LOPR"].hide();
        me["IDG1-DISC"].hide();
        me["IDG2-LOPR"].hide();
        me["IDG2-DISC"].hide();
        me["IDG2-RISE-label"].hide();
        me["IDG2-RISE-Value"].hide();
        me["IDG1-RISE-label"].hide();
        me["IDG1-RISE-Value"].hide();
        me["Shed-label"].hide();
        me["GalleyShed"].hide();
        me["GLoad"].hide();
        me["ACESS-SHED"].hide();

        me.updateBottomStatus();
    },
};
