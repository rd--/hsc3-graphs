-- freqShift ; shifting a 100Hz tone by 1 Hz rising to 500Hz
let i = sinOsc AR 100 0
    s = xLine KR 1 500 5 RemoveSynth
in freqShift i s 0 * 0.1
