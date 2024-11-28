// https://www.mcld.co.uk/cymbalsynthesis/ ; 1
Ringz.ar(PinkNoise.ar() * 0.1, { exprand(300, 20000) } ! 100, 1).mean ! 2

// https://www.mcld.co.uk/cymbalsynthesis/ ; 2
var cutoffenv = EnvGen.ar(Env.perc(0, 5, 1, -4), 1, 1, 0, 1, 0) * 20000 + 10;
var driver = LPF.ar(WhiteNoise.ar() * 0.1, cutoffenv);
var freqs = { exprand(300, 20000) } ! 100;
Ringz.ar(driver, freqs, 1).mean ! 2 * 0.25

// https://www.mcld.co.uk/cymbalsynthesis/ ; 3
var locutoffenv = EnvGen.ar(Env.perc(0.25, 5, 1, -4), 1, 1, 0, 1, 0) * 20000 + 10;
var lodriver = LPF.ar(WhiteNoise.ar() * 0.1, locutoffenv);
var hicutoffenv = 10001 - (EnvGen.ar(Env.perc(1, 3, 1, -4), 1, 1, 0, 1, 0) * 10000);
var hidriver = HPF.ar(WhiteNoise.ar() * 0.1, hicutoffenv) * EnvGen.ar(Env.perc(1, 2, 0.25), 1, 1, 0, 1, 0);
var freqs = { exprand(300, 20000) } ! 100;
Ringz.ar(lodriver + hidriver, freqs, 1).mean ! 2 * 0.25

// https://www.mcld.co.uk/cymbalsynthesis/ ; 4
var locutoffenv = EnvGen.ar(Env.perc(0.5, 5, 1, -4), 1, 1, 0, 1, 0) * 20000 + 10;
var lodriver = LPF.ar(WhiteNoise.ar() * 0.1, locutoffenv);
var hicutoffenv = 10001 - (EnvGen.ar(Env.perc(1, 3, 1, -4), 1, 1, 0, 1, 0) * 10000);
var hidriver = HPF.ar(WhiteNoise.ar() * 0.1, hicutoffenv) * EnvGen.ar(Env.perc(1, 2, 0.25), 1, 1, 0, 1, 0);
var freqs = { exprand(300, 20000) } ! 100;
var res = Ringz.ar(lodriver + hidriver, freqs, 1).mean;
((res * 1) + (lodriver * 2)) ! 2 * 0.25

// https://www.mcld.co.uk/cymbalsynthesis/ ; 5
var locutoffenv = EnvGen.ar(Env.perc(0.5, 5, 1, -4), 1, 1, 0, 1, 0) * 20000 + 10;
var lodriver = LPF.ar(WhiteNoise.ar() * 0.1, locutoffenv);
var hicutoffenv = 10001 - (EnvGen.ar(Env.perc(1, 3, 1, -4), 1, 1, 0, 1, 0) * 10000);
var hidriver = HPF.ar(WhiteNoise.ar() * 0.1, hicutoffenv) * EnvGen.ar(Env.perc(1, 2, 0.25, -4), 1, 1, 0, 1, 0);
var thwack = EnvGen.ar(Env.perc(0.001, 0.001, 1, -4), 1, 1, 0, 1, 0);
var freqs = { exprand(300, 20000) } ! 100;
var res = Ringz.ar(lodriver + hidriver + thwack, freqs, 1).mean;
((res * 1) + (lodriver * 2) + thwack) ! 2 * 0.25
