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
            "accuonly","accuonlyarrow","ALTNbrk",
            "spoiler1Lex","spoiler2Lex","spoiler3Lex","spoiler4Lex","spoiler5Lex",
            "spoiler1Rex","spoiler2Rex","spoiler3Rex","spoiler4Rex","spoiler5Rex",
            "GLoad",
        ];
    },
    initPage: func() {
        # Currently unused things
        me["accuonly"].hide();
        me["accuonlyarrow"].hide();
        me["ALTNbrk"].hide();
        me["spoiler1Lex"].hide();
        me["spoiler2Lex"].hide();
        me["spoiler3Lex"].hide();
        me["spoiler4Lex"].hide();
        me["spoiler5Lex"].hide();
        me["spoiler1Rex"].hide();
        me["spoiler2Rex"].hide();
        me["spoiler3Rex"].hide();
        me["spoiler4Rex"].hide();
        me["spoiler5Rex"].hide();
        me["GLoad"].hide();
    },
    update: func() {
        me.updateBottomStatus();
    },
};
