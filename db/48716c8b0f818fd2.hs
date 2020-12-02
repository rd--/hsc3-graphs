-- MiBraids ; 31:FLUTED
let pit = 38;
    timb = mouseX KR 0.7 1 Linear 0.2
    color = mouseY KR 0 1 Linear 0.2
in X.miBraids AR pit timb color (X.miBraids_mode "FLUTED") 0 1 0 0 0 * 0.1
