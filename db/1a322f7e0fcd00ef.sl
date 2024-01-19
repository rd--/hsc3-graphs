{- F0 ; http://www.listarc.bham.ac.uk/lists/sc-users/msg69041.html ; requires=EnvLinen -}
let freq1 = 174.61; let freq2 = 196.00; let freq3 = 130.81;
let pan = 0.0;
let atk = 0.1; let sus = 0.5; let rls = 2.0; let gate = 1;
let arpDur = 0.25;
let freq = [freq1, freq2, freq3];
let env = EnvLinen(atk, sus, rls, 1, [1, 1, 1]).asEnvGen(DelayN(gate, arpDur, [0, 0.5, 1] * arpDur).kr);
let sig = GVerb((SinOsc(freq, 0) * env).Sum, 150, 5, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 0.1;
Pan2(sig, pan, 0.25).transposed.Sum <! DetectSilence(sig, 0.0001, 0.1, 2)
