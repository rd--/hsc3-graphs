// https://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml)
var numChan = 2;
var totalInst = 50;
var partials = 40;
var baseFreq = 69.midicps;
var scale = Scale.major(\just);
var voiceFunc = {
    var sig = Decay.ar(Dust.ar(1 / totalInst) * 0.5, 0.001) * PinkNoise.ar;
    var freq = { baseFreq * scale.degreeToRatio(0.rrand(60)) }.dup(partials);
    var a = [freq, { 0.1.rrand(0.9) }.dup(partials), { 0.5.rrand(9.0) }.dup(partials)];
    Klank.ar(Ref.new(a), sig, 1, 0, 1)
};
SplayAz.arFill(numChan, totalInst, voiceFunc)
