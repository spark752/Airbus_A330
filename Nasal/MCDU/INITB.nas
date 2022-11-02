# A3XX mCDU by Joshua Davidson (Octal450) and Jonathan Redpath

# Copyright (c) 2020 Josh Davidson (Octal450)

var initInputB = func(key, i) {
    var scratchpad = getprop("/MCDU[" ~ i ~ "]/scratchpad");
    var weight_kgs_used =
            getprop("/systems/acconfig/options/weight-kgs");
    if (key == "R1") { # ZFW/ZFWCG
        if (scratchpad == "CLR") {
            notAllowed(i);
        } else {
            # Range check limits. Real MCDU software used a wide range check
            # that was later refined to be specific to the aircraft type.
            # Units are thousands of pounds or converted to metric tons.
            var zfw_min = 200;
            var zfw_max = (getprop(
                "/limits/mass-and-balance/maximum-zero-fuel-mass-lbs") + 100) /
                1000;
            if (weight_kgs_used) {
                zfw_min = zfw_min * LB2KG;
                zfw_max = zfw_max * LB2KG;
            }

            if (size(scratchpad) == 0) {
                # Auto fill into scratchpad
                var zfw = getprop("/FMGC/internal/gw"); # Pounds
                if (weight_kgs_used) {
                    zfw = ((zfw * LB2KG) -
                        getprop("/consumables/fuel/total-fuel-kg")) / 1000;
                } else {
                    zfw = (zfw - getprop("/consumables/fuel/total-fuel-lbs"))
                        / 1000;
                }
                var zfwcg = 25;
                setprop("/MCDU[" ~ i ~ "]/scratchpad", sprintf("%3.1f/%3.1f",
                    zfw, zfwcg));
            } else {
                # Validate
                var update_zfw = 0;
                var update_zfwcg = 0;
                var splut = split("/", scratchpad);
                var zfw = num(splut[0]);
                if (zfw != nil) {
                    if (zfw >= zfw_min and zfw <= zfw_max) {
                        update_zfw = 1;
                    } else {
                        statusMsg(i, "ENTRY OUT OF RANGE");
                        return;
                    }
                }
                var zfwcg = 25;
                if (size(splut) > 1) {
                    zfwcg = num(splut[1]);
                    if (zfwcg != nil) {
                        if (zfwcg >= 0 and zfwcg <= 99.9) {
                            update_zfwcg = 1;
                        } else {
                            statusMsg(i, "ENTRY OUT OF RANGE");
                            return;
                        }
                    }
                }

                # Update
                if (update_zfw == 1) {
                    # FMGC property is stored in thousands of pounds
                    if (weight_kgs_used) {
                        setprop("/FMGC/internal/zfw", zfw * KG2LB);
                    } else {
                        setprop("/FMGC/internal/zfw", zfw);
                    }
                    setprop("/FMGC/internal/zfw-set", 1);
                }
                if (update_zfwcg == 1) {
                    setprop("/FMGC/internal/zfwcg", zfwcg);
                    setprop("/FMGC/internal/zfwcg-set", 1);
                }
                if (update_zfw == 1 or update_zfwcg == 1) {
                    setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
                }
            }
        }
    } else if (key == "R2") { # Block fuel weight
        if (scratchpad == "CLR") {
            setprop("/FMGC/internal/block", 0.0);
            setprop("/FMGC/internal/block-set", 0);
            setprop("/MCDU[" ~ i ~ "]/scratchpad-msg", 0);
            setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
        } else {
            if (size(scratchpad) == 0) {
                # Auto fill into scratchpad
                var fuel = 0;
                if (weight_kgs_used) {
                    fuel = getprop("/consumables/fuel/total-fuel-kg") / 1000;
                } else {
                    fuel = getprop("/consumables/fuel/total-fuel-lbs") / 1000;
                }
                setprop("/MCDU[" ~ i ~ "]/scratchpad", sprintf("%3.1f", fuel));
            } else {
                # Upper limit "maxblock" is set manually in the model variant
                # specific -set.xml file in thousands of pounds and may not
                # reflect the actual fuel capacity
                var fuel = num(scratchpad);
                if (fuel != nil) {
                    if (weight_kgs_used) {
                        fuel = fuel * KG2LB;
                    }
                    if (fuel > 0 and fuel <= getprop("/options/maxblock")) {
                        setprop("/FMGC/internal/block", fuel);
                        setprop("/FMGC/internal/block-set", 1);
                        setprop("/MCDU[" ~ i ~ "]/scratchpad", "");
                    } else {
                        statusMsg(i, "ENTRY OUT OF RANGE");
                    }
                } else {
                    statusMsg(i, "ENTRY OUT OF RANGE");
                }
            }
        }
    }
}

var initArrowB = func(key, i) {
    if (key == "left" or key == "right") {
        setprop("/MCDU[" ~ i ~ "]/page", "INITA");
    }
}
