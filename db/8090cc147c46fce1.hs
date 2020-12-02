-- amplitude ; control gain
let s = soundIn 0
    a = amplitude KR s 0.01 0.01
in pulse AR 90 0.3 * a
