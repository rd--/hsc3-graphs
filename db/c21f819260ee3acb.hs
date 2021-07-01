-- gendy1 ; use SINUS to track oscillator and take CP positions from it ; use adParam and ddParam
let p = lfPulse kr 100 0 0.4
    s = sinOsc kr 30 0 * 0.5
in gendy1Id 'α' ar 6 6 p s 440 660 0.5 0.5 12 12 * 0.2
