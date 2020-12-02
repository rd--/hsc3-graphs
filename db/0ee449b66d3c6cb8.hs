-- dbrown
let n = demand (impulse KR 10 0) 0 (dbrown 'α' dinf (-1) 1 0.05)
    f = linExp n (-1) 1 64 9600
in sinOsc AR f 0 * 0.1
