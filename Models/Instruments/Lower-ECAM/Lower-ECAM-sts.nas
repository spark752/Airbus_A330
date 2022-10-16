# Lower ECAM Status Page
#
# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_sts = {
    new: func(canvas_group, file) {
        var m = {parents: [canvas_lowerECAM_sts, canvas_lowerECAM_base]};
        m.init(canvas_group, file);
        return m;
    },
    getKeys: func() {
        return ["TAT","SAT","GW","UTCh","UTCm","GW-weight-unit"];
    },
    update: func() {
        me.updateBottomStatus();    
    },    
};
