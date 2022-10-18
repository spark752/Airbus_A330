# Lower ECAM Engine Page
# Based on A3XX Lower ECAM Canvas
# Copyright (c) 2020 Josh Davidson (Octal450)

# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_eng = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_eng, canvas_lowerECAM_base]};
        m.init("eng.svg");
        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","GW-weight-unit","Fused-weight-unit","OilQT1-needle","OilQT2-needle","OilQT1","OilQT2","OilQT1-decimal","OilQT2-decimal","OilPSI1-needle","OilPSI2-needle","OilPSI1","OilPSI2"];
    },
    update: func() {
        # Oil Quantity
        var oil_quant1 = getprop("/engines/engine[0]/oil-qt-actual");
        var oil_quant2 = getprop("/engines/engine[1]/oil-qt-actual");
        me["OilQT1"].setText(sprintf("%s", math.round(oil_quant1)));
        me["OilQT2"].setText(sprintf("%s", math.round(oil_quant2)));
        me["OilQT1-decimal"].setText(sprintf("%s", int(10*math.mod(oil_quant1, 1))));
        me["OilQT2-decimal"].setText(sprintf("%s", int(10*math.mod(oil_quant2, 1))));
        me["OilQT1-needle"].setRotation((getprop("/ECAM/Lower/Oil-QT[0]") + 90) * D2R);
        me["OilQT2-needle"].setRotation((getprop("/ECAM/Lower/Oil-QT[1]") + 90) * D2R);

        # Oil Pressure
        if (getprop("/engines/engine[0]/oil-psi-actual") >= 20) {
            me["OilPSI1"].setColor(0.0509,0.7529,0.2941);
            me["OilPSI1-needle"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["OilPSI1"].setColor(1,0,0);
            me["OilPSI1-needle"].setColor(1,0,0);
        }

        if (getprop("/engines/engine[1]/oil-psi-actual") >= 20) {
            me["OilPSI2"].setColor(0.0509,0.7529,0.2941);
            me["OilPSI2-needle"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["OilPSI2"].setColor(1,0,0);
            me["OilPSI2-needle"].setColor(1,0,0);
        }

        me["OilPSI1"].setText(sprintf("%s", math.round(getprop("/engines/engine[0]/oil-psi-actual"))));
        me["OilPSI2"].setText(sprintf("%s", math.round(getprop("/engines/engine[1]/oil-psi-actual"))));

        me["OilPSI1-needle"].setRotation((getprop("/ECAM/Lower/Oil-PSI[0]") + 90) * D2R);
        me["OilPSI2-needle"].setRotation((getprop("/ECAM/Lower/Oil-PSI[1]") + 90) * D2R);

        # Fuel Used (Not yet supported but the label is there)
        if (acconfig_weight_kgs.getValue() == 1) {
            me["Fused-weight-unit"].setText("KG");
        } else {
            me["Fused-weight-unit"].setText("LBS");
        }

        me.updateBottomStatus();
    },
};
