# A3XX mCDU by Joshua Davidson (Octal450) and Jonathan Redpath

# Copyright (c) 2020 Josh Davidson (Octal450)

var perfDESInput = func(key, i) {
	if (key == "L2") {
		setCostIndex(i);
	} else if (key == "L6") {
		setprop("/MCDU[" ~ i ~ "]/page", "PERFCRZ");
	} else if (key == "R6") {
		setprop("/MCDU[" ~ i ~ "]/page", "PERFAPPR");
	}
}

var perfAPPRInput = func(key, i) {
	if (key == "L2") {
		setCostIndex(i);
	} else if (key == "L6") {
		setprop("/MCDU[" ~ i ~ "]/page", "PERFDES");
	} else if (key == "R6") {
		setprop("/MCDU[" ~ i ~ "]/page", "PERFGA");
	}
}

var perfGAInput = func(key, i) {
	if (key == "L2") {
		setCostIndex(i);
	} else if (key == "L6") {
		setprop("/MCDU[" ~ i ~ "]/page", "PERFAPPR");
	}
}
