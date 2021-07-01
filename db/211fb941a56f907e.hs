-- amplitude ; control gain
let s = soundIn 0
    a = amplitude kr s 0.01 0.01
in pulse ar 90 0.3 * a
