# Lower ECAM Flight Controls Page
# Based on A3XX Lower ECAM Canvas
# Copyright (c) 2020 Josh Davidson (Octal450)

# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

# Performance debug average of ten averages = 680 uS, slow compared to others.
# TODO: Optimize this!

var canvas_lowerECAM_fctl = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_fctl, canvas_lowerECAM_base]};
        m.init("fctl.svg");

        return m;
    },
    getKeys: func() {
        return["TAT","SAT","GW","UTCh","UTCm","ailL","ailR","ailL_out","ailR_out","elevL","elevR","PTcc","PT","PTupdn","prim1","prim2","prim3","sec1","sec2","ailLblue","ailRblue","elevLblue","elevRblue","rudderblue","ailLgreen","ailRgreen","ailLgreen2",
        "ailRgreen2","elevLgreen","ruddergreen","PTgreen","elevRyellow","rudderyellow","ailLyellow","ailRyellow","PTyellow","rudder","spdbrkblue","spdbrkgreen","spdbrkyellow","spoiler1Rex","spoiler1Rrt","spoiler2Rex","spoiler2Rrt","spoiler3Rex","spoiler3Rrt",
        "spoiler4Rex","spoiler4Rrt","spoiler5Rex","spoiler5Rrt","spoiler1Lex","spoiler1Lrt","spoiler2Lex","spoiler2Lrt","spoiler3Lex","spoiler3Lrt","spoiler4Lex","spoiler4Lrt","spoiler5Lex","spoiler5Lrt","spoiler1Rf","spoiler2Rf","spoiler3Rf","spoiler4Rf",
        "spoiler5Rf","spoiler1Lf","spoiler2Lf","spoiler3Lf","spoiler4Lf","spoiler5Lf","ailLscale","ailRscale","path4249","path4249-3","path4338","path4249-3-6-7","path4249-3-6-7-5","GW-weight-unit"];
    },
    update: func() {
        var blue_psi = getprop("/systems/hydraulic/blue-psi");
        var green_psi = getprop("/systems/hydraulic/green-psi");
        var yellow_psi = getprop("/systems/hydraulic/yellow-psi");

        # Pitch Trim
        me["PT"].setText(sprintf("%2.1f", math.round(getprop("/ECAM/Lower/elevator-trim-deg"), 0.1)));

        if (math.round(getprop("/ECAM/Lower/elevator-trim-deg"), 0.1) >= 0) {
            me["PTupdn"].setText(sprintf("UP"));
        } else if (math.round(getprop("/ECAM/Lower/elevator-trim-deg"), 0.1) < 0) {
            me["PTupdn"].setText(sprintf("DN"));
        }

        if (green_psi < 1500 and yellow_psi < 1500) {
            me["PT"].setColor(0.7333,0.3803,0);
            me["PTupdn"].setColor(0.7333,0.3803,0);
            me["PTcc"].setColor(0.7333,0.3803,0);
        } else {
            me["PT"].setColor(0.0509,0.7529,0.2941);
            me["PTupdn"].setColor(0.0509,0.7529,0.2941);
            me["PTcc"].setColor(0.0509,0.7529,0.2941);
        }

        # Ailerons
        me["ailL"].setTranslation(0,getprop("/ECAM/Lower/aileron-ind-in-left") * 100);
        me["ailR"].setTranslation(0,getprop("/ECAM/Lower/aileron-ind-in-right") * (-100));
        me["ailL_out"].setTranslation(0,getprop("/ECAM/Lower/aileron-ind-out-left") * 100);
        me["ailR_out"].setTranslation(0,getprop("/ECAM/Lower/aileron-ind-out-right") * (-100));

        if (blue_psi < 1500 and green_psi < 1500) {
            me["ailL"].setColor(0.7333,0.3803,0);
            me["ailR"].setColor(0.7333,0.3803,0);
            me["ailL_out"].setColor(0.7333,0.3803,0);
            me["ailR_out"].setColor(0.7333,0.3803,0);
        } else {
            me["ailL"].setColor(0.0509,0.7529,0.2941);
            me["ailR"].setColor(0.0509,0.7529,0.2941);
            me["ailL_out"].setColor(0.0509,0.7529,0.2941);
            me["ailR_out"].setColor(0.0509,0.7529,0.2941);
        }

        # Elevators
        me["elevL"].setTranslation(0,getprop("/ECAM/Lower/elevator-ind-left") * 100);
        me["elevR"].setTranslation(0,getprop("/ECAM/Lower/elevator-ind-right") * 100);

        if (blue_psi < 1500 and green_psi < 1500) {
            me["elevL"].setColor(0.7333,0.3803,0);
        } else {
            me["elevL"].setColor(0.0509,0.7529,0.2941);
        }

        if (blue_psi < 1500 and yellow_psi < 1500) {
            me["elevR"].setColor(0.7333,0.3803,0);
        } else {
            me["elevR"].setColor(0.0509,0.7529,0.2941);
        }

        # Rudder
        me["rudder"].setRotation(getprop("/fdm/jsbsim/hydraulics/rudder/final-deg") * -0.0189873417721519);

        if (blue_psi < 1500 and yellow_psi < 1500 and green_psi < 1500) {
            me["rudder"].setColor(0.7333,0.3803,0);
        } else {
            me["rudder"].setColor(0.0509,0.7529,0.2941);
        }

        # Spoilers
        if (getprop("/fdm/jsbsim/hydraulics/spoiler-l1/final-deg") < 1.5) {
            me["spoiler1Lex"].hide();
            me["spoiler1Lrt"].show();
        } else {
            me["spoiler1Lrt"].hide();
            me["spoiler1Lex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-l2/final-deg") < 1.5) {
            me["spoiler2Lex"].hide();
            me["spoiler2Lrt"].show();
        } else {
            me["spoiler2Lrt"].hide();
            me["spoiler2Lex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-l3/final-deg") < 1.5) {
            me["spoiler3Lex"].hide();
            me["spoiler3Lrt"].show();
        } else {
            me["spoiler3Lrt"].hide();
            me["spoiler3Lex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-l4/final-deg") < 1.5) {
            me["spoiler4Lex"].hide();
            me["spoiler4Lrt"].show();
        } else {
            me["spoiler4Lrt"].hide();
            me["spoiler4Lex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-l5/final-deg") < 1.5) {
            me["spoiler5Lex"].hide();
            me["spoiler5Lrt"].show();
        } else {
            me["spoiler5Lrt"].hide();
            me["spoiler5Lex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-r1/final-deg") < 1.5) {
            me["spoiler1Rex"].hide();
            me["spoiler1Rrt"].show();
        } else {
            me["spoiler1Rrt"].hide();
            me["spoiler1Rex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-r2/final-deg") < 1.5) {
            me["spoiler2Rex"].hide();
            me["spoiler2Rrt"].show();
        } else {
            me["spoiler2Rrt"].hide();
            me["spoiler2Rex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-r3/final-deg") < 1.5) {
            me["spoiler3Rex"].hide();
            me["spoiler3Rrt"].show();
        } else {
            me["spoiler3Rrt"].hide();
            me["spoiler3Rex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-r4/final-deg") < 1.5) {
            me["spoiler4Rex"].hide();
            me["spoiler4Rrt"].show();
        } else {
            me["spoiler4Rrt"].hide();
            me["spoiler4Rex"].show();
        }

        if (getprop("/fdm/jsbsim/hydraulics/spoiler-r5/final-deg") < 1.5) {
            me["spoiler5Rex"].hide();
            me["spoiler5Rrt"].show();
        } else {
            me["spoiler5Rrt"].hide();
            me["spoiler5Rex"].show();
        }

        # Spoiler Fail
        if (getprop("/systems/failures/spoiler-l1") or green_psi < 1500) {
            me["spoiler1Lex"].setColor(0.7333,0.3803,0);
            me["spoiler1Lrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-l1/final-deg") < 1.5) {
                me["spoiler1Lf"].show();
            } else {
                me["spoiler1Lf"].hide();
            }
        } else {
            me["spoiler1Lex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler1Lrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler1Lf"].hide();
        }

        if (getprop("/systems/failures/spoiler-l2") or blue_psi < 1500) {
            me["spoiler2Lex"].setColor(0.7333,0.3803,0);
            me["spoiler2Lrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-l2/final-deg") < 1.5) {
                me["spoiler2Lf"].show();
            } else {
                me["spoiler2Lf"].hide();
            }
        } else {
            me["spoiler2Lex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler2Lrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler2Lf"].hide();
        }

        if (getprop("/systems/failures/spoiler-l3") or blue_psi < 1500) {
            me["spoiler3Lex"].setColor(0.7333,0.3803,0);
            me["spoiler3Lrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-l3/final-deg") < 1.5) {
                me["spoiler3Lf"].show();
            } else {
                me["spoiler3Lf"].hide();
            }
        } else {
            me["spoiler3Lex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler3Lrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler3Lf"].hide();
        }

        if (getprop("/systems/failures/spoiler-l4") or yellow_psi < 1500) {
            me["spoiler4Lex"].setColor(0.7333,0.3803,0);
            me["spoiler4Lrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-l4/final-deg") < 1.5) {
                me["spoiler4Lf"].show();
            } else {
                me["spoiler4Lf"].hide();
            }
        } else {
            me["spoiler4Lex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler4Lrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler4Lf"].hide();
        }

        if (getprop("/systems/failures/spoiler-l5") or green_psi < 1500) {
            me["spoiler5Lex"].setColor(0.7333,0.3803,0);
            me["spoiler5Lrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-l5/final-deg") < 1.5) {
                me["spoiler5Lf"].show();
            } else {
                me["spoiler5Lf"].hide();
            }
        } else {
            me["spoiler5Lex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler5Lrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler5Lf"].hide();
        }

        if (getprop("/systems/failures/spoiler-r1") or green_psi < 1500) {
            me["spoiler1Rex"].setColor(0.7333,0.3803,0);
            me["spoiler1Rrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-r1/final-deg") < 1.5) {
                me["spoiler1Rf"].show();
            } else {
                me["spoiler1Rf"].hide();
            }
        } else {
            me["spoiler1Rex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler1Rrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler1Rf"].hide();
        }

        if (getprop("/systems/failures/spoiler-r2") or blue_psi < 1500) {
            me["spoiler2Rex"].setColor(0.7333,0.3803,0);
            me["spoiler2Rrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-r2/final-deg") < 1.5) {
                me["spoiler2Rf"].show();
            } else {
                me["spoiler2Rf"].hide();
            }
        } else {
            me["spoiler2Rex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler2Rrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler2Rf"].hide();
        }

        if (getprop("/systems/failures/spoiler-r3") or blue_psi < 1500) {
            me["spoiler3Rex"].setColor(0.7333,0.3803,0);
            me["spoiler3Rrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-r3/final-deg") < 1.5) {
                me["spoiler3Rf"].show();
            } else {
                me["spoiler3Rf"].hide();
            }
        } else {
            me["spoiler3Rex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler3Rrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler3Rf"].hide();
        }

        if (getprop("/systems/failures/spoiler-r4") or yellow_psi < 1500) {
            me["spoiler4Rex"].setColor(0.7333,0.3803,0);
            me["spoiler4Rrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-r4/final-deg") < 1.5) {
                me["spoiler4Rf"].show();
            } else {
                me["spoiler4Rf"].hide();
            }
        } else {
            me["spoiler4Rex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler4Rrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler4Rf"].hide();
        }

        if (getprop("/systems/failures/spoiler-r5") or green_psi < 1500) {
            me["spoiler5Rex"].setColor(0.7333,0.3803,0);
            me["spoiler5Rrt"].setColor(0.7333,0.3803,0);
            if (getprop("/fdm/jsbsim/hydraulics/spoiler-r5/final-deg") < 1.5) {
                me["spoiler5Rf"].show();
            } else {
                me["spoiler5Rf"].hide();
            }
        } else {
            me["spoiler5Rex"].setColor(0.0509,0.7529,0.2941);
            me["spoiler5Rrt"].setColor(0.0509,0.7529,0.2941);
            me["spoiler5Rf"].hide();
        }

        # Flight Computers
        if (getprop("/systems/fctl/prim1")) {
            me["prim1"].setColor(0.0509,0.7529,0.2941);
            me["path4249"].setColor(0.0509,0.7529,0.2941);
        } else if ((getprop("/systems/fctl/prim1") == 0) or (getprop("/systems/failures/prim1") == 1)) {
            me["prim1"].setColor(0.7333,0.3803,0);
            me["path4249"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/fctl/prim2")) {
            me["prim2"].setColor(0.0509,0.7529,0.2941);
            me["path4249-3"].setColor(0.0509,0.7529,0.2941);
        } else if ((getprop("/systems/fctl/prim2") == 0) or (getprop("/systems/failures/prim2") == 1)) {
            me["prim2"].setColor(0.7333,0.3803,0);
            me["path4249-3"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/fctl/prim3")) {
            me["prim3"].setColor(0.0509,0.7529,0.2941);
            me["path4338"].setColor(0.0509,0.7529,0.2941);
        } else if ((getprop("/systems/fctl/prim3") == 0) or (getprop("/systems/failures/prim3") == 1)) {
            me["prim3"].setColor(0.7333,0.3803,0);
            me["path4338"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/fctl/sec1")) {
            me["sec1"].setColor(0.0509,0.7529,0.2941);
            me["path4249-3-6-7"].setColor(0.0509,0.7529,0.2941);
        } else if ((getprop("/systems/fctl/sec1") == 0) or (getprop("/systems/failures/sec1") == 1)) {
            me["sec1"].setColor(0.7333,0.3803,0);
            me["path4249-3-6-7"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/fctl/sec2")) {
            me["sec2"].setColor(0.0509,0.7529,0.2941);
            me["path4249-3-6-7-5"].setColor(0.0509,0.7529,0.2941);
        } else if ((getprop("/systems/fctl/sec2") == 0) or (getprop("/systems/failures/sec2") == 1)) {
            me["sec2"].setColor(0.7333,0.3803,0);
            me["path4249-3-6-7-5"].setColor(0.7333,0.3803,0);
        }

        # Hydraulic Indicators
        if (getprop("/systems/hydraulic/blue-psi") >= 1500) {
            me["ailLblue"].setColor(0.0509,0.7529,0.2941);
            me["ailRblue"].setColor(0.0509,0.7529,0.2941);
            me["elevLblue"].setColor(0.0509,0.7529,0.2941);
            me["elevRblue"].setColor(0.0509,0.7529,0.2941);
            me["rudderblue"].setColor(0.0509,0.7529,0.2941);
            me["spdbrkblue"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["ailLblue"].setColor(0.7333,0.3803,0);
            me["ailRblue"].setColor(0.7333,0.3803,0);
            me["elevLblue"].setColor(0.7333,0.3803,0);
            me["elevRblue"].setColor(0.7333,0.3803,0);
            me["rudderblue"].setColor(0.7333,0.3803,0);
            me["spdbrkblue"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/hydraulic/green-psi") >= 1500) {
            me["ailLgreen"].setColor(0.0509,0.7529,0.2941);
            me["ailRgreen"].setColor(0.0509,0.7529,0.2941);
            me["ailLgreen2"].setColor(0.0509,0.7529,0.2941);
            me["ailRgreen2"].setColor(0.0509,0.7529,0.2941);
            me["elevLgreen"].setColor(0.0509,0.7529,0.2941);
            me["ruddergreen"].setColor(0.0509,0.7529,0.2941);
            me["PTgreen"].setColor(0.0509,0.7529,0.2941);
            me["spdbrkgreen"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["ailLgreen"].setColor(0.7333,0.3803,0);
            me["ailRgreen"].setColor(0.7333,0.3803,0);
            me["ailLgreen2"].setColor(0.7333,0.3803,0);
            me["ailRgreen2"].setColor(0.7333,0.3803,0);
            me["elevLgreen"].setColor(0.7333,0.3803,0);
            me["ruddergreen"].setColor(0.7333,0.3803,0);
            me["PTgreen"].setColor(0.7333,0.3803,0);
            me["spdbrkgreen"].setColor(0.7333,0.3803,0);
        }

        if (getprop("/systems/hydraulic/yellow-psi") >= 1500) {
            me["ailLyellow"].setColor(0.0509,0.7529,0.2941);
            me["ailRyellow"].setColor(0.0509,0.7529,0.2941);
            me["elevRyellow"].setColor(0.0509,0.7529,0.2941);
            me["rudderyellow"].setColor(0.0509,0.7529,0.2941);
            me["PTyellow"].setColor(0.0509,0.7529,0.2941);
            me["spdbrkyellow"].setColor(0.0509,0.7529,0.2941);
        } else {
            me["ailLyellow"].setColor(0.7333,0.3803,0);
            me["ailRyellow"].setColor(0.7333,0.3803,0);
            me["elevRyellow"].setColor(0.7333,0.3803,0);
            me["rudderyellow"].setColor(0.7333,0.3803,0);
            me["PTyellow"].setColor(0.7333,0.3803,0);
            me["spdbrkyellow"].setColor(0.7333,0.3803,0);
        }

        me.updateBottomStatus();
    },
};
