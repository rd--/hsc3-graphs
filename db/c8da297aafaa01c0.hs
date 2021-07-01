-- amplitude
let s = soundIn 0
    a = amplitude ar s 0.5 0.05
in s * a
