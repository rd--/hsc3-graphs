-- gendy1 ; use SINUS to track oscillator and take CP positions from it ; use adParam and ddParam
let p = lfPulse KR 100 0 0.4
    s = sinOsc KR 30 0 * 0.5
in gendy1 'α' AR 6 6 p s 440 660 0.5 0.5 12 12 * 0.2
