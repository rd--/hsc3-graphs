-- amplitude ; control frequency
let s = soundIn 0
    f = amplitude KR s 0.5 0.5 * 1200 + 400
in sinOsc AR f 0 * 0.1
