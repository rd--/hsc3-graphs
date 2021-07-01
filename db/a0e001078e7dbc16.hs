-- gendy1 ; near the corners are interesting
let x = mouseX kr 0 200 Linear 0.1
    y = mouseY kr 0 200 Linear 0.1
    p = lfPulse kr x 0 0.4
    s = sinOsc kr y 0 * 0.5
in gendy1Id 'α' ar 6 6 p s 440 660 0.5 0.5 12 12 * 0.2
