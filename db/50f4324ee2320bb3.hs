-- amplitude
let s = soundIn 0
    a = amplitude AR s 0.5 0.05
in s * a
