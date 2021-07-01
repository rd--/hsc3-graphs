-- MiBraids ; 31:FLUTED
let pit = 38;
    timb = mouseX kr 0.7 1 Linear 0.2
    color = mouseY kr 0 1 Linear 0.2
in X.miBraids ar pit timb color (X.miBraids_mode "FLUTED") 0 1 0 0 0 * 0.1
