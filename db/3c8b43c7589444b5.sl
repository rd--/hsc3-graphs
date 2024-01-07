let i = Impulse([0.5 1 2], 0);
let c = LfCub([300 900 1200], 0);
let s = Decay(i, [0.1 0.05 0.25]) * c * 0.05;
GVerb(s, 10, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).Mix
