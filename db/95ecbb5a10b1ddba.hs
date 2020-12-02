-- gendy1 ; near the corners are interesting
let x = mouseX KR 0 200 Linear 0.1
    y = mouseY KR 0 200 Linear 0.1
    p = lfPulse KR x 0 0.4
    s = sinOsc KR y 0 * 0.5
in gendy1 'α' AR 6 6 p s 440 660 0.5 0.5 12 12 * 0.2
