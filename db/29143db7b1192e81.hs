-- gendy1 ; wasp
let ad = sinOsc kr 0.1 0 * 0.1 + 0.9
in gendy1Id 'α' ar 0 0 ad 1.0 50 1000 1 0.005 12 12 * 0.2
