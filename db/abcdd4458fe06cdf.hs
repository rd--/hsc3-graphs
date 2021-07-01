-- dbrown
let n = demand (impulse kr 10 0) 0 (dbrownId 'α' dinf (-1) 1 0.05)
    f = linExp n (-1) 1 64 9600
in sinOsc ar f 0 * 0.1
