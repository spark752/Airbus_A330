# A3XX mCDU by Joshua Davidson (Octal450) and Jonathan Redpath

# Copyright (c) 2020 Josh Davidson (Octal450)

var MCDU_init = func(i) {
    MCDU_reset(i); # Reset MCDU, clears data
};

var MCDU_reset = func(i) {
    setprop("/MCDU[" ~ i ~ "]/active", 0);
    setprop("/it-autoflight/settings/togaspd", 157);
    setprop("/MCDU[" ~ i ~ "]/last-scratchpad", "");
    setprop("/MCDU[" ~ i ~ "]/last-page", "NONE");
    setprop("/MCDU[" ~ i ~ "]/last-fmgc-page", "STATUS");
    setprop("/MCDU[" ~ i ~ "]/page", "MCDU");
    setprop("/MCDU[" ~ i ~ "]/scratchpad", "SELECT DESIRED SYSTEM");
    setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
    setprop("/MCDUC/flight-num", "");
    setprop("/MCDUC/thracc-set", 0);
    setprop("/MCDUC/reducacc-set", 0);
    setprop("/MCDUC/flight-num-set", 0);
    setprop("/FMGC/internal/flex", 0);
    setprop("/FMGC/internal/dep-arpt", "");
    setprop("/FMGC/internal/arr-arpt", "");
    setprop("/FMGC/internal/cruise-ft", 10000);
    setprop("/FMGC/internal/cruise-fl", 100);
    setprop("/FMGC/internal/cost-index", "0");
    setprop("/FMGC/internal/trans-alt", 18000);
    setprop("/FMGC/internal/reduc-agl-ft", "3000");
    setprop("/FMGC/internal/eng-out-reduc", "3500");
    setprop("/FMGC/internal/v1", 0);
    setprop("/FMGC/internal/vr", 0);
    setprop("/FMGC/internal/v2", 0);
    setprop("/FMGC/internal/block", 0.0);
    setprop("/FMGC/internal/zfw", 0);
    setprop("/FMGC/internal/zfwcg", 25); # 25% default
    setprop("/FMGC/internal/v1-set", 0);
    setprop("/FMGC/internal/vr-set", 0);
    setprop("/FMGC/internal/v2-set", 0);
    setprop("/FMGC/internal/block-set", 0);
    setprop("/FMGC/internal/zfw-set", 0);
    setprop("/FMGC/internal/zfwcg-set", 0);
    setprop("/FMGC/internal/to-flap", 0);
    setprop("/FMGC/internal/to-ths", "0.0");
    setprop("/FMGC/internal/tofrom-set", 0);
    setprop("/FMGC/internal/cost-index-set", 0);
    setprop("/FMGC/internal/cruise-lvl-set", 0);
    setprop("/FMGC/internal/flap-ths-set", 0);
    setprop("/FMGC/internal/flex-set", 0);
    setprop("/FMGC/internal/ils1freq-set", 0);
    setprop("/FMGC/internal/ils1crs-set", 0);
    setprop("/FMGC/internal/vor1freq-set", 0);
    setprop("/FMGC/internal/vor1crs-set", 0);
    setprop("/FMGC/internal/vor2freq-set", 0);
    setprop("/FMGC/internal/vor2crs-set", 0);
    setprop("/FMGC/internal/adf1freq-set", 0);
    setprop("/FMGC/internal/adf2freq-set", 0);
    setprop("/FMGC/internal/navdatabase", "01JAN-28JAN");
    setprop("/FMGC/internal/navdatabase2", "29JAN-26FEB");
    setprop("/FMGC/internal/navdatabasecode", "AB20170101");
    setprop("/FMGC/internal/navdatabasecode2", "AB20170102");
    setprop("/FMGC/print/mcdu/page1/L1auto", 0);
    setprop("/FMGC/print/mcdu/page1/L2auto", 0);
    setprop("/FMGC/print/mcdu/page1/L3auto", 0);
    setprop("/FMGC/print/mcdu/page1/R1req", 0);
    setprop("/FMGC/print/mcdu/page1/R2req", 0);
    setprop("/FMGC/print/mcdu/page1/R3req", 0);
    setprop("/FMGC/print/mcdu/page2/L1auto", 0);
    setprop("/FMGC/print/mcdu/page2/L2auto", 0);
    setprop("/FMGC/print/mcdu/page2/L3auto", 0);
    setprop("/FMGC/print/mcdu/page2/L4auto", 0);
    setprop("/FMGC/print/mcdu/page2/R1req", 0);
    setprop("/FMGC/print/mcdu/page2/R2req", 0);
    setprop("/FMGC/print/mcdu/page2/R3req", 0);
    setprop("/FMGC/print/mcdu/page2/R4req", 0);
    setprop("/FMGC/internal/tropo", 36090);
    setprop("/FMGC/internal/tropo-set", 0);

    # APPR PERF
    setprop("/FMGC/internal/dest-qnh", -1);
    setprop("/FMGC/internal/dest-temp", -999);
    #fmgc.FMGCInternal.destMag = 0;
    #fmgc.FMGCInternal.destMagSet = 0;
    #fmgc.FMGCInternal.destWind = 0;
    #fmgc.FMGCInternal.destWindSet = 0;
    #fmgc.FMGCInternal.vappSpeedSet = 0;
    setprop("/FMGC/internal/final", "");
    setprop("/FMGC/internal/baro", 99999);
    setprop("/FMGC/internal/radio", 99999);
    #fmgc.FMGCInternal.radioNo = 0;
    setprop("/FMGC/internal/ldg-elev", 0);
    #fmgc.FMGCInternal.ldgConfig3 = 0;
    #fmgc.FMGCInternal.ldgConfigFull = 1;
};

# Process left and right Line Select Keys (LSKs)
var processLSK = func(btn, i) {
    var lsk_map = {
        "MCDU": menuInput,
        "STATUS": statusInput,
        "INITA": initInputA,
        "INITB": initInputB,
        "RADNAV": radnavInput,
        "PERFTO": perfTOInput,
        "PERFCLB": perfCLBInput,
        "PERFCRZ": perfCRZInput,
        "PERFDES": perfDESInput,
        "PERFAPPR": perfAPPRInput,
        "PERFGA": perfGAInput,
        "DATA": dataInput,
        # "DATA2": dataInput,
        # "F-PLNA": initInputA,
        # "FUELPRED": initInputA,
        "PRINTFUNC": printInput,
        "PRINTFUNC2": printInput2,
    };
    var f = lsk_map[getprop("/MCDU[" ~ i ~ "]/page")];
    if (f != nil) {
        f(btn, i);
    }
};

# Called by MCDU xml files for Left Line Select Keys
var lskbutton = func(btn, i) {
    processLSK("L" ~ btn, i);
};
var lskbutton_b = func(btn, i) {
    # Special Middle Click Functions
};

# Called by MCDU xml files for Right Line Select Keys
var rskbutton = func(btn, i) {
    processLSK("R" ~ btn, i);
};
var rskbutton_b = func(btn, i) {
    # Special Middle Click Functions
};

var arrowbutton = func(btn, i) {
    var arrow_map = {
        "DATA": dataArrow,
        "DATA2": dataArrow2,
        "INITA": initArrowA,
        "INITB": initArrowB,
    };
    var f = arrow_map[getprop("/MCDU[" ~ i ~ "]/page")];
    if (f != nil) {
        f(btn, i);
    }
}

var pagebutton = func(btn, i) {
    var page = getprop("/MCDU[" ~ i ~ "]/page");
    if (page != "MCDU") {
        if (btn == "radnav") {
            setprop("/MCDU[" ~ i ~ "]/page", "RADNAV");
        } else if (btn == "perf") {
            var phase = getprop("/FMGC/status/phase");
            if (phase == 0 or phase == 1) {
                setprop("/MCDU[" ~ i ~ "]/page", "PERFTO");
            } else if (phase == 2) {
                setprop("/MCDU[" ~ i ~ "]/page", "PERFCLB");
            } else if (phase == 3) {
                setprop("/MCDU[" ~ i ~ "]/page", "PERFCRZ");
            } else if (phase == 4) {
                setprop("/MCDU[" ~ i ~ "]/page", "PERFDES");
            }
        } else if (btn == "init") {
            setprop("/MCDU[" ~ i ~ "]/page", "INITA");
        } else if (btn == "data") {
            setprop("/MCDU[" ~ i ~ "]/page", "DATA");
        } else if (btn == "mcdu") {
            setprop("/MCDU[" ~ i ~ "]/last-page", page);
            setprop("/MCDU[" ~ i ~ "]/last-fmgc-page", page);
            setprop("/MCDU[" ~ i ~ "]/scratchpad", "SELECT DESIRED SYSTEM");
            setprop("/MCDU[" ~ i ~ "]/page", "MCDU");
        } else if (btn == "f-pln") {
            setprop("/MCDU[" ~ i ~ "]/page", "F-PLNA");
        } else if (btn == "fuel-pred") {
            setprop("/MCDU[" ~ i ~ "]/page", "FUELPRED");
        }
    }
}

var button = func(btn, i) {
    var page = getprop("/MCDU[" ~ i ~ "]/page");
    if (getprop("/MCDU[" ~ i ~ "]/scratchpad-msg") == 0 and (page != "MCDU")) {
        var scratchpad = getprop("/MCDU[" ~ i ~ "]/scratchpad");
        if (btn == "A") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "A");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "B") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "B");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "C") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "C");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "D") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "D");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "E") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "E");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "F") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "F");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "G") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "G");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "H") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "H");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "I") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "I");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "J") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "J");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "K") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "K");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "L") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "L");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "M") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "M");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "N") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "N");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "O") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "O");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "P") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "P");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "Q") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "Q");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "R") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "R");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "S") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "S");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "T") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "T");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "U") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "U");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "V") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "V");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "W") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "W");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "X") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "X");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "Y") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "Y");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "Z") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "Z");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "SLASH") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "/");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "SP") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ " ");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "CLR") {
            var scratchpad = getprop("/MCDU[" ~ i ~ "]/scratchpad");
            if (size(scratchpad) == 0) {
                setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 1);
                setprop("/MCDU[" ~ i ~ "]/scratchpad", "CLR");
            } else if (getprop("/MCDU[" ~ i ~ "]/scratchpad-msg") == 1) {
                setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
                setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
            } else if (size(scratchpad) > 0) {
                setprop("/MCDU[" ~ i ~ "]/last-scratchpad", "");
                setprop("/MCDU[" ~ i ~ "]/scratchpad", left(scratchpad, size(scratchpad) - 1));
                setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
            }
        } else if (btn == "0") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "0");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "1") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "1");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "2") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "2");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "3") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "3");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "4") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "4");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "5") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "5");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "6") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "6");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "7") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "7");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "8") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "8");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "9") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "9");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "DOT") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ ".");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        } else if (btn == "PLUSMINUS") {
            setprop("/MCDU[" ~ i ~ "]/scratchpad", scratchpad ~ "-");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        }
    } else {
        if (btn == "CLR") {
            var scratchpad = getprop("/MCDU[" ~ i ~ "]/scratchpad");
            if (size(scratchpad) == 0) {
                setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 1);
                setprop("/MCDU[" ~ i ~ "]/scratchpad", "CLR");
            } else if (getprop("/MCDU[" ~ i ~ "]/scratchpad-msg") == 1) {
                setprop("/MCDU[" ~ i ~ "]/scratchpad", getprop("/MCDU[" ~ i ~ "]/last-scratchpad"));
                setprop("/MCDU[" ~ i ~ "]/last-scratchpad", "");
                setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
            }
        }
    }
}

var notAllowed = func(i) {
    if (getprop("/MCDU[" ~ i ~ "]/scratchpad") != "NOT ALLOWED") {
        if (getprop("/MCDU[" ~ i ~ "]/scratchpad-msg") == 1) {
            setprop("/MCDU[" ~ i ~ "]/last-scratchpad", "");
        } else {
            setprop("/MCDU[" ~ i ~ "]/last-scratchpad", getprop("/MCDU[" ~ i ~ "]/scratchpad"));
        }
    }
    setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 1);
    setprop("/MCDU[" ~ i ~ "]/scratchpad", "NOT ALLOWED");
}

var aocDisabled = func(i) {
    if (getprop("/MCDU[" ~ i ~ "]/scratchpad") != "AOC DISABLED") {
        if (getprop("/MCDU[" ~ i ~ "]/scratchpad-msg") == 1) {
            setprop("/MCDU[" ~ i ~ "]/last-scratchpad", "");
        } else {
            setprop("/MCDU[" ~ i ~ "]/last-scratchpad",
                getprop("/MCDU[" ~ i ~ "]/scratchpad"));
        }
    }
    setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 1);
    setprop("/MCDU[" ~ i ~ "]/scratchpad", "AOC DISABLED");
}

var screenFlash = func(time, i) {
    var page = getprop("/MCDU[" ~ i ~ "]/page");
    setprop("/MCDU[" ~ i ~ "]/page", "NONE");
    settimer(func {
        setprop("/MCDU[" ~ i ~ "]/page", page);
    }, time);
}

# Input function for the MCDU MENU page
var menuInput = func(btn, i) {
    if (btn == "L1") {
        if (getprop("/MCDU[" ~ i ~ "]/active") != 2) {
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 1);
            setprop("/MCDU[" ~ i ~ "]/scratchpad", "WAIT FOR SYSTEM RESPONSE");
            setprop("/MCDU[" ~ i ~ "]/active", 1);
            settimer(func(){
                setprop("/MCDU[" ~ i ~ "]/page",
                    getprop("/MCDU[" ~ i ~ "]/last-fmgc-page"));
                setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
                setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
                setprop("/MCDU[" ~ i ~ "]/active", 2);
            }, 2);
        } else {
            setprop("/MCDU[" ~ i ~ "]/page",
                getprop("/MCDU[" ~ i ~ "]/last-fmgc-page"));
            setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        }
    } else if (btn == "R6") {
        if (getprop("/MCDU[" ~ i ~ "]/last-page") != "NONE") {
            setprop("/MCDU[" ~ i ~ "]/page",
                getprop("/MCDU[" ~ i ~ "]/last-page"));
           setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
           setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        }
    }
};

# Set the cost index to the value in the scratchpad
var setCostIndex = func(i) {
    var scratchpad = getprop("/MCDU[" ~ i ~ "]/scratchpad");
    if (scratchpad == "CLR") {
        setprop("/FMGC/internal/cost-index", 0);
        setprop("/FMGC/internal/cost-index-set", 0);
        setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
        setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
    } else {
        var ci = int(scratchpad);
        var cis = size(scratchpad);
        if (cis >= 1 and cis <= 3) {
            if (ci == nil) {
                notAllowed(i);
            } else if (ci >= 0 and ci <= 999) {
                setprop("/FMGC/internal/cost-index", ci);
                setprop("/FMGC/internal/cost-index-set", 1);
                setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
            } else {
                notAllowed(i);
            }
        } else {
            notAllowed(i);
        }
    }
};
