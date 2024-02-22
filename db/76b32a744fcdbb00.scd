// using lfsaw and noise for modulation and index ; https://github.com/cianoc/supercollider_fragments
var pitchArray = [60, 62, 64, 65, 67, 69, 71, 72].scramble.midicps.dup(2);
var sequencer = Select.kr(Stepper.kr(Impulse.kr(3), pitchArray.size - 1), pitchArray);
PMOsc.ar(sequencer, LFNoise1.kr(1).range(200, 800), LFSaw.kr(1).range(5, 25)) * 0.15
