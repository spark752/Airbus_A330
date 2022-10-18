# Lower ECAM Hydraulics Page
#
# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_hyd = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_hyd, canvas_lowerECAM_base]};
        m.init("hyd.svg");
        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","GW-weight-unit",
            "ELEC-OVHT-Yellow","ELEC-OVHT-Blue",
            "LO-AIR-PRESS-Yellow","LO-AIR-PRESS-Blue","LO-AIR-PRESS-Green",
            "OVHT-Yellow","OVHT-Blue","OVHT-Green",
            "Pump-LOPR-Green","Pump-LOPR-Blue","Pump-LOPR-Yellow",
            "GLoad",
        ];
    },
    initPage: func() {
        # Currently unused things
        me["ELEC-OVHT-Yellow"].hide();
        me["ELEC-OVHT-Blue"].hide();
        me["LO-AIR-PRESS-Yellow"].hide();
        me["LO-AIR-PRESS-Blue"].hide();
        me["LO-AIR-PRESS-Green"].hide();
        me["OVHT-Yellow"].hide();
        me["OVHT-Blue"].hide();
        me["OVHT-Green"].hide();
        me["Pump-LOPR-Green"].hide();
        me["Pump-LOPR-Blue"].hide();
        me["Pump-LOPR-Yellow"].hide();
        me["GLoad"].hide();
    },    
    update: func() {
        me.updateBottomStatus();
    },
};
