// using stepper to sequence notes and timbres ; https://github.com/cianoc/supercollider_fragments
{var rate = 5
;var trig = Impulse.kr(rate)
;var freqArray = [48, 50, 52, 53, 55, 57, 59, 60, 62, 64, 65, 67, 69, 71, 72].scramble.midicps
;var ratioArray = {1.0.rrand(3.0)}.dup(20)
;var indexArray = {1.0.rrand(4.0)}.dup(20)
;var env = EnvGen.kr(Env.perc(0, 1 / rate), gate: trig)
;var car = Select.kr(Stepper.kr(trig, freqArray.size - 1), freqArray)
;var mod = car * Select.kr(Stepper.kr(trig, ratioArray.size - 1), ratioArray)
;var ix = Select.kr(Stepper.kr(trig, indexArray.size - 1), indexArray) + env * 4
;PMOsc.ar(car, mod, ix, mul: env * 0.25)}
