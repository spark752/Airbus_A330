# Lower ECAM Flight Controls Page
# Based on A3XX Lower ECAM Canvas
# Copyright (c) 2020 Josh Davidson (Octal450)

# A330-main.xml puts this in the same namespace as Lower-ECAM.nas and
# Upper-ECAM.nas

var canvas_lowerECAM_fctl = {
    new: func() {
        var m = {parents: [canvas_lowerECAM_fctl, canvas_lowerECAM_base]};
        m.init("fctl.svg");

        return m;
    },
    getKeys: func() {
        return["TAT","SAT","GW","UTCh","UTCm",
            "ailL","ailR","ailL_out","ailR_out","elevL","elevR",
            "PTcc","PT","PTupdn","prim1","prim2","prim3","sec1","sec2",
            "ailLblue","ailRblue","elevLblue","elevRblue","rudderblue",
            "ailLgreen","ailRgreen","ailLgreen2","ailRgreen2",
            "elevLgreen","ruddergreen","PTgreen","elevRyellow",
            "rudderyellow","ailLyellow","ailRyellow","PTyellow","rudder",
            "spdbrkblue","spdbrkgreen","spdbrkyellow","spoiler1Rex",
            "spoiler1Rrt","spoiler2Rex","spoiler2Rrt","spoiler3Rex",
            "spoiler3Rrt","spoiler4Rex","spoiler4Rrt","spoiler5Rex",
            "spoiler5Rrt","spoiler1Lex","spoiler1Lrt","spoiler2Lex",
            "spoiler2Lrt","spoiler3Lex","spoiler3Lrt","spoiler4Lex",
            "spoiler4Lrt","spoiler5Lex","spoiler5Lrt","spoiler1Rf",
            "spoiler2Rf","spoiler3Rf","spoiler4Rf","spoiler5Rf",
            "spoiler1Lf","spoiler2Lf","spoiler3Lf","spoiler4Lf","spoiler5Lf",
            "ailLscale","ailRscale","path4249","path4249-3","path4338",
            "path4249-3-6-7","path4249-3-6-7-5","GW-weight-unit"
        ];
    },
    blue_status: {},
    green_status: {},
    yellow_status: {},
    fcc_status: [],
    spoiler_status: [],
    initPage: func() {
        # Monitor hydraulic low pressure status
        me.blue_status = lowerECAM_gen_monitor.new();
        me.green_status = lowerECAM_gen_monitor.new();
        me.yellow_status = lowerECAM_gen_monitor.new();

        # Monitor flight control computer status
        append(me.fcc_status,
            lowerECAM_prop_monitor.new("/systems/fctl/prim1"));
        append(me.fcc_status,
            lowerECAM_prop_monitor.new("/systems/fctl/prim2"));
        append(me.fcc_status,
            lowerECAM_prop_monitor.new("/systems/fctl/prim3"));
        append(me.fcc_status,
            lowerECAM_prop_monitor.new("/systems/fctl/sec1"));
        append(me.fcc_status,
            lowerECAM_prop_monitor.new("/systems/fctl/sec2"));

        # Monitor spoiler fail status
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-l1"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-l2"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-l3"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-l4"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-l5"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-r1"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-r2"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-r3"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-r4"));
        append(me.spoiler_status,
            lowerECAM_prop_monitor.new("/systems/failures/spoiler-r5"));
    },
    update: func() {
        # Collect hydraulic status
        var blue_psi = getprop("/systems/hydraulic/blue-psi");
        var green_psi = getprop("/systems/hydraulic/green-psi");
        var yellow_psi = getprop("/systems/hydraulic/yellow-psi");
        var blue_low = blue_psi < 1500;
        var green_low = green_psi < 1500;
        var yellow_low = yellow_psi < 1500;
        me.blue_status.update(blue_low);
        me.green_status.update(green_low);
        me.yellow_status.update(yellow_low);
        var blue_test = me.blue_status.test();
        var green_test = me.green_status.test();
        var yellow_test = me.yellow_status.test();

        # Collect flight control computer status
        forindex(var i; me.fcc_status) {
            me.fcc_status[i].update();
        }

        # Collect spoiler fail status
        forindex(var i; me.spoiler_status) {
            me.spoiler_status[i].update();
        }

        # Pitch Trim
        var elev_trim = getprop("/ECAM/Lower/elevator-trim-deg");
        me["PT"].setText(sprintf("%2.1f", elev_trim));
        if (elev_trim >= 0) {
            me["PTupdn"].setText(sprintf("UP"));
        } else {
            me["PTupdn"].setText(sprintf("DN"));
        }
        if (green_test or yellow_test) {
            if (green_low and yellow_low) {
                me["PT"].setColor(0.7333,0.3803,0);
                me["PTupdn"].setColor(0.7333,0.3803,0);
                me["PTcc"].setColor(0.7333,0.3803,0);
            } else {
                me["PT"].setColor(0.0509,0.7529,0.2941);
                me["PTupdn"].setColor(0.0509,0.7529,0.2941);
                me["PTcc"].setColor(0.0509,0.7529,0.2941);
            }
        }

        # Ailerons
        me["ailL"].setTranslation(0,
            getprop("/ECAM/Lower/aileron-ind-in-left") * 100);
        me["ailR"].setTranslation(0,
            getprop("/ECAM/Lower/aileron-ind-in-right") * -100);
        me["ailL_out"].setTranslation(0,
            getprop("/ECAM/Lower/aileron-ind-out-left") * 100);
        me["ailR_out"].setTranslation(0,
            getprop("/ECAM/Lower/aileron-ind-out-right") * -100);
        if (blue_test or green_test) {
            if (blue_low and green_low) {
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
        }

        # Elevators
        me["elevL"].setTranslation(0,
            getprop("/ECAM/Lower/elevator-ind-left") * 100);
        me["elevR"].setTranslation(0,
            getprop("/ECAM/Lower/elevator-ind-right") * 100);
        if (blue_test or green_test) {
            if (blue_low and green_low) {
                me["elevL"].setColor(0.7333,0.3803,0);
            } else {
                me["elevL"].setColor(0.0509,0.7529,0.2941);
            }
            if (blue_low and yellow_low) {
                me["elevR"].setColor(0.7333,0.3803,0);
            } else {
                me["elevR"].setColor(0.0509,0.7529,0.2941);
            }
        }

        # Rudder
        me["rudder"].setRotation(
            getprop("/fdm/jsbsim/hydraulics/rudder/final-deg") *
            -0.0189873417721519);
        if (blue_test or green_test or yellow_test) {
            if (blue_low and green_low and yellow_low) {
                me["rudder"].setColor(0.7333,0.3803,0);
            } else {
                me["rudder"].setColor(0.0509,0.7529,0.2941);
            }
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
        if (me.spoiler_status[0].test() or green_test) {
            if (me.spoiler_status[0].value or green_low) {
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
        }
        if (me.spoiler_status[1].test() or blue_test) {
            if (me.spoiler_status[1].value or blue_low) {
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
        }
        if (me.spoiler_status[2].test() or blue_test) {
            if (me.spoiler_status[2].value or blue_low) {
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
        }
        if (me.spoiler_status[3].test() or yellow_test) {
            if (me.spoiler_status[3].value or yellow_low) {
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
        }
        if (me.spoiler_status[4].test() or green_test) {
            if (me.spoiler_status[4].value or green_low) {
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
        }
        if (me.spoiler_status[5].test() or green_test) {
            if (me.spoiler_status[5].value or green_low) {
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
        }
        if (me.spoiler_status[6].test() or blue_test) {
            if (me.spoiler_status[6].value or blue_low) {
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
        }
        if (me.spoiler_status[7].test() or blue_test) {
            if (me.spoiler_status[7].value or blue_low) {
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
        }
        if (me.spoiler_status[8].test() or yellow_test) {
            if (me.spoiler_status[8].value or yellow_low) {
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
        }
        if (me.spoiler_status[9].test() or green_test) {
            if (me.spoiler_status[9].value or green_low) {
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
        }

        # Flight Computers
        if (me.fcc_status[0].test()) {
            if (me.fcc_status[0].value) {
                me["prim1"].setColor(0.0509,0.7529,0.2941);
                me["path4249"].setColor(0.0509,0.7529,0.2941);
            } else {
                me["prim1"].setColor(0.7333,0.3803,0);
                me["path4249"].setColor(0.7333,0.3803,0);
            }
        }
        if (me.fcc_status[1].test()) {
            if (me.fcc_status[1].value) {
                me["prim2"].setColor(0.0509,0.7529,0.2941);
                me["path4249-3"].setColor(0.0509,0.7529,0.2941);
            } else {
                me["prim2"].setColor(0.7333,0.3803,0);
                me["path4249-3"].setColor(0.7333,0.3803,0);
            }
        }
        if (me.fcc_status[2].test()) {
            if (me.fcc_status[2].value) {
                me["prim3"].setColor(0.0509,0.7529,0.2941);
                me["path4338"].setColor(0.0509,0.7529,0.2941);
            } else {
                me["prim3"].setColor(0.7333,0.3803,0);
                me["path4338"].setColor(0.7333,0.3803,0);
            }
        }
        if (me.fcc_status[3].test()) {
            if (me.fcc_status[3].value) {
                me["sec1"].setColor(0.0509,0.7529,0.2941);
                me["path4249-3-6-7"].setColor(0.0509,0.7529,0.2941);
            } else {
                me["sec1"].setColor(0.7333,0.3803,0);
                me["path4249-3-6-7"].setColor(0.7333,0.3803,0);
            }
        }
        if (me.fcc_status[4].test()) {
            if (me.fcc_status[4].value) {
                me["sec2"].setColor(0.0509,0.7529,0.2941);
                me["path4249-3-6-7-5"].setColor(0.0509,0.7529,0.2941);
            } else {
                me["sec2"].setColor(0.7333,0.3803,0);
                me["path4249-3-6-7-5"].setColor(0.7333,0.3803,0);
            }
        }

        # Hydraulic Indicators
        if (blue_test) {
            if (blue_low) {
                me["ailLblue"].setColor(0.7333,0.3803,0);
                me["ailRblue"].setColor(0.7333,0.3803,0);
                me["elevLblue"].setColor(0.7333,0.3803,0);
                me["elevRblue"].setColor(0.7333,0.3803,0);
                me["rudderblue"].setColor(0.7333,0.3803,0);
                me["spdbrkblue"].setColor(0.7333,0.3803,0);
            } else {
                me["ailLblue"].setColor(0.0509,0.7529,0.2941);
                me["ailRblue"].setColor(0.0509,0.7529,0.2941);
                me["elevLblue"].setColor(0.0509,0.7529,0.2941);
                me["elevRblue"].setColor(0.0509,0.7529,0.2941);
                me["rudderblue"].setColor(0.0509,0.7529,0.2941);
                me["spdbrkblue"].setColor(0.0509,0.7529,0.2941);
            }
        }
        if (green_test) {
            if (green_low) {
                me["ailLgreen"].setColor(0.7333,0.3803,0);
                me["ailRgreen"].setColor(0.7333,0.3803,0);
                me["ailLgreen2"].setColor(0.7333,0.3803,0);
                me["ailRgreen2"].setColor(0.7333,0.3803,0);
                me["elevLgreen"].setColor(0.7333,0.3803,0);
                me["ruddergreen"].setColor(0.7333,0.3803,0);
                me["PTgreen"].setColor(0.7333,0.3803,0);
                me["spdbrkgreen"].setColor(0.7333,0.3803,0);
            } else {
                me["ailLgreen"].setColor(0.0509,0.7529,0.2941);
                me["ailRgreen"].setColor(0.0509,0.7529,0.2941);
                me["ailLgreen2"].setColor(0.0509,0.7529,0.2941);
                me["ailRgreen2"].setColor(0.0509,0.7529,0.2941);
                me["elevLgreen"].setColor(0.0509,0.7529,0.2941);
                me["ruddergreen"].setColor(0.0509,0.7529,0.2941);
                me["PTgreen"].setColor(0.0509,0.7529,0.2941);
                me["spdbrkgreen"].setColor(0.0509,0.7529,0.2941);
            }
        }
        if (yellow_test) {
            if (yellow_low) {
                me["ailLyellow"].setColor(0.7333,0.3803,0);
                me["ailRyellow"].setColor(0.7333,0.3803,0);
                me["elevRyellow"].setColor(0.7333,0.3803,0);
                me["rudderyellow"].setColor(0.7333,0.3803,0);
                me["PTyellow"].setColor(0.7333,0.3803,0);
                me["spdbrkyellow"].setColor(0.7333,0.3803,0);
            } else {
                me["ailLyellow"].setColor(0.0509,0.7529,0.2941);
                me["ailRyellow"].setColor(0.0509,0.7529,0.2941);
                me["elevRyellow"].setColor(0.0509,0.7529,0.2941);
                me["rudderyellow"].setColor(0.0509,0.7529,0.2941);
                me["PTyellow"].setColor(0.0509,0.7529,0.2941);
                me["spdbrkyellow"].setColor(0.0509,0.7529,0.2941);
            }
        }

        # Bottom section
        me.updateBottomStatus();
    },
};
