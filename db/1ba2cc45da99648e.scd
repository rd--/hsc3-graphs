// TXLine
var trigger = Impulse.ar(0.25, 0);
var gainEnv = Decay2.ar(trigger, 0.01, 1);
Pan2.ar(Saw.ar(TXLine.ar(100, 1000, 0.1, trigger)), TLine.ar(-1, 1, 0.75, trigger), gainEnv)
