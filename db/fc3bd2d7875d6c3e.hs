-- freqShift ; Shifting a complex tone by 1 Hz rising to 500Hz
let d = klangSpec [101, 303, 606, 808] [1, 1, 1, 1] [1, 1, 1, 1]
    i = klang AR 1 0 d
    s = xLine KR 1 500 5 RemoveSynth
in freqShift i s 0 * 0.1
